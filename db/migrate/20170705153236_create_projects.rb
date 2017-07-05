class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.integer :entity_id
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end

    add_index :projects, [:entity_id, :name], unique: true
  end
end
