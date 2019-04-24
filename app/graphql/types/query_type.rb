module Types
  class QueryType < Types::BaseObject
    description "root response"

    field :users, [Types::UserType], :null => false do
      description "List of users"
    end

    field :user, Types::UserType, :null => false do
      argument :email, String, required: false
      argument :name, String, required: false
    end

    def users
      User.all
    end

    def user(params)
      User.find_by(params)
    end
  end
end
