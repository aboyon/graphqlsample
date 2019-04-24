class Types::AssignmentType < Types::BaseObject
  description "A given assignment for a task"
  field :id, ID, :null => false
  field :task_status, String, :null => true, :description => "Task's status at the moment to be assigned to user"
  field :created_at, String, :null => true, :description => "Date time when the task was assigned to user"
  field :task, Types::TaskType, :null => true, :description => "Task information"
  field :user, Types::UserType, :null => true, :description => "User information"
end
