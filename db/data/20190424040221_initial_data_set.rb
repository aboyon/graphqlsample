class InitialDataSet < SeedMigration::Migration
  def up
    dsilveira = User.create!(:name => 'David Silveira', :email => 'jdsilveira@gmail.com')
    default_project = Project.create!(:name => 'Default Project', :key => 'DEF')
    setup_docker_container = Task.create!(:name => 'Setup Docker container', :project => default_project)
    setup_rails = Task.create!(:name => 'Setup Rails project', :project => default_project)
    dsilveira.projects << default_project
    Assignment.create!(:task => setup_docker_container, :user => dsilveira)
    Assignment.create!(:task => setup_rails, :user => dsilveira)
  end

  def down
    Assignment.delete_all
    Task.delete_all
    Project.delete_all
    User.delete_all
  end
end
