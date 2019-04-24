class InitialDataSet < SeedMigration::Migration
  def up
    dsilveira = User.create!(:name => 'David Silveira', :email => 'jdsilveira@gmail.com')
    anotheruser = User.create!(:name => 'John Doe', :email => 'anotheruser+1@gmail.com')
    eliud = User.create!(:name => 'Eliud Kipchoge', :email => 'anotheruser+2@gmail.com')
    default_project = Project.create!(:name => 'Default Project', :key => 'DEF')
    run42lessthan2hs = Project.create!(:name => 'Run 42K under 2hs', :key => 'RUN')
    setup_docker_container = Task.create!(:name => 'Setup Docker container', :project => default_project)
    setup_rails = Task.create!(:name => 'Setup Rails project', :project => default_project)
    insanetraining = Task.create!(:name => 'Insane steady run pace', :project => run42lessthan2hs)
    dsilveira.projects << default_project
    eliud.projects << run42lessthan2hs
    Assignment.create!(:task => setup_docker_container, :user => dsilveira)
    Assignment.create!(:task => setup_rails, :user => dsilveira)
    Assignment.create!(:task => insanetraining, :user => eliud)
  end

  def down
    Assignment.delete_all
    Task.delete_all
    Project.delete_all
    User.delete_all
  end
end
