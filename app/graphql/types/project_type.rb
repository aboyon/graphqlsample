class Types::ProjectType < Types::BaseObject
  description "A system project"
  field :id, ID, null: false
  field :name, String, null: false
  field :tasks, [Types::TaskType], null: true, description: "Tasks existing in this project"
end
