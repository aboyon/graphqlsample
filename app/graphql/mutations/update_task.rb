class Mutations::UpdateTask < Mutations::UpdateMutation
  argument :id, Int, required: true
  argument :name, String, required: false
  argument :status, String, required: true

  field :task, Types::TaskType, null: true
  field :errors, [String], null: false

  def resolve(**params)
    super do |task|
      task.name = params[:name] if params[:name].present?
      task.status = params[:status] if params[:status].present?
    end
  end

  def resource_klass
    Task
  end
end
