class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :key
      t.boolean :active

      t.timestamps
    end

    add_index :projects, :name
    add_index :projects, :key, :unique => true
  end
end
