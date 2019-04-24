class Mutations::CreateAssignment < Mutations::BaseMutation
  argument :task_id, Int, required: true
  argument :user_id, Int, required: true

  field :assignment, Types::AssignmentType, null: true
  field :errors, [String], null: false

  def resolve(task_id:, user_id:)
    assignment = Assignment.new(task_id: task_id, user_id: user_id)
    if assignment.save
      {
        :assignment => assignment,
        :errors => []
      }
    else
      {:assignment => nil, :errors => task.errors.full_messages }
    end
  end
end
