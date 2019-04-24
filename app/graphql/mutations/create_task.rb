class Mutations::CreateTask < Mutations::BaseMutation
  argument :name, String, required: true
  argument :project_id, Int, required: true

  field :task, Types::TaskType, null: true
  field :errors, [String], null: false

  def resolve(name:, project_id:)
    task = Task.new(name: name, project_id: project_id)
    if task.save
      {:task => task, :errors => []}
    else
      {:task => nil, :errors => task.errors.full_messages }
    end
  end
end
