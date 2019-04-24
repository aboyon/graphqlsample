class Types::TaskType < Types::BaseObject
  description "A system task"
  field :id, ID, null: false
  field :name, String, null: false
  field :status, String, null: false
  field :project, Types::ProjectType, null: true, description: "Task's project"
end
