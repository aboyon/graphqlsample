class Types::UserType < Types::BaseObject
  description "A system user"
  graphql_name "User"

  field :id, ID, null: false
  field :name, String, null: false, :description => "the email"
  field :email, String, null: false
  field :tasks, [Types::TaskType], null: true, description: "Tasks assigned to a user"
  field :projects, [Types::ProjectType], null: true, description: "Tasks assigned to a user"
end
