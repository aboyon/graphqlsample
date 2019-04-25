module Types
  class QueryType < Types::BaseObject
    description "Query type schema"

    # Fetch all users from system
    # @params <String, name> optional. @desc Filter by name
    field :users, [Types::UserType], :null => false do
      description "List of users"
      argument :name, String, :required => false
    end
    def users(**params)
      return User.all unless params&.any?
      User.search_name(params[:name]) if params[:name].present?
    end

    # Fetch a single user from system
    # @params <String, name> optional. @desc Using name as key
    # @params <String, email> optional. @desc Using email as key
    field :user, Types::UserType, :null => false do
      description "Fetch a new user from app."
      argument :email, String, :required => false
      argument :name, String, :required => false
    end
    def user(params)
      User.find_by(params)
    end

    # Fetch all tasks in system
    # @params <String, status> optional. @desc filter by status
    # @params <Int, user_id> optional. @desc filter by user
    field :tasks, [Types::TaskType], :null => false do
      description "A list of tasks in system"
      argument :status, String, :required => false
      argument :user_id, Int, :required => false
    end
    def tasks(**params)
      return Task.all unless params&.any?
      query = Task.where(params.except(:user_id))
      query = query.for_user(params[:user_id]) if params[:user_id].present?
      query
    end

    # Fetch all project in system
    # @params <String, name> optional. @desc filter by project name
    field :projects, [Types::ProjectType], :null => false do
      description "A list of projects in system"
      argument :name, String, :required => false
    end
    def projects(**params)
      return Project.all unless params&.any?
      Project.search_name(params[:name]) if params[:name].present?
    end
  end
end
