class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.belongs_to :task
      t.belongs_to :user
      t.string :task_status

      t.timestamps
    end
  end
end
