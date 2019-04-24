class Types::TaskType < Types::BaseObject
  description "A system task"
  field :id, ID, :null => false
  field :name, String, :null => false, :description => "Task's name/title"
  field :status, String, :null => false, :description => "Current task status"
  field :project, Types::ProjectType, :null => true, :description => "Task's project"
  field :assignments, [Types::AssignmentType], :null => true, :description => "Assignments lists"
end
