class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.string :status, :default => Task::STATUS[:pending]

      t.timestamps
    end
    add_index :tasks, :name
    add_index :tasks, :status
  end
end
