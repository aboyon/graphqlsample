module Types
  class QueryType < Types::BaseObject
    description "root response"

    field :users, [Types::UserType], :null => false do
      description "List of users"
      argument :name, String, :required => false
    end

    field :user, Types::UserType, :null => false do
      description "Fetch a new user from app."
      argument :email, String, :required => false
      argument :name, String, :required => false
    end

    field :tasks, [Types::TaskType], :null => false do
      description "A list of tasks in system"
      argument :status, String, :required => false
      argument :user_id, Int, :required => false
    end

    field :projects, [Types::ProjectType], :null => false do
      description "A list of projects in system"
      argument :name, String, :required => false
    end

    def users(**params)
      return User.all unless params&.any?
      if params[:name].present?
        query = User.search_name(params[:name])
      end
      query
    end

    def user(params)
      User.find_by(params)
    end

    def tasks(**params)
      return Task.all unless params&.any?
      query = Task.where(params.except(:user_id))
      query = query.for_user(params[:user_id]) if params[:user_id].present?
      query
    end

    def projects(**params)
      return Project.all unless params&.any?
      Project.where(params[:name])
    end
  end
end
