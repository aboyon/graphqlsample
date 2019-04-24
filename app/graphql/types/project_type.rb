class Types::ProjectType < Types::BaseObject
  description "A system project"
  field :id, ID, :null => false
  field :name, String, :null => false, :description => "Project's name"
  field :key, String, :null => false, :description => "Shortcut to identify a project by task name"
  field :tasks, [Types::TaskType], :null => true, description: "Tasks existing in this project"
end
