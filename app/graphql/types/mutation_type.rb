module Types
  class MutationType < Types::BaseObject
    field :create_task, :mutation => Mutations::CreateTask, :description => "Create a new task"
    field :create_project, :mutation => Mutations::CreateProject, :description => "Create a new project"
    field :create_assignment, :mutation => Mutations::CreateAssignment, :description => "Assign a task to a user"

    field :update_task, :mutation => Mutations::UpdateTask, :description => "Update a given task"
  end
end
