class Mutations::CreateProject < Mutations::BaseMutation
  argument :name, String, required: true
  argument :key, String, required: false

  field :project, Types::ProjectType, null: true
  field :errors, [String], null: false

  def resolve(name:, key: nil)
    project = Project.new(:name => name)
    if project.save
      {project: project, :errors => []}
    else
      {project: nil, :errors => project.errors.full_messages }
    end
  end
end
