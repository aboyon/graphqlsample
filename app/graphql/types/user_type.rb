class Types::UserType < Types::BaseObject
  description "A system user"

  field :id, ID, :null => false
  field :name, String, :null => false, :description => "User's full name"
  field :email, String, :null => false, :description => "User's email. It's unique"
  field :tasks, [Types::TaskType], :null => true, :description => "All user's tasks"
  field :projects, [Types::ProjectType], :null => true, :description => "Project's where the user is involved."
end
