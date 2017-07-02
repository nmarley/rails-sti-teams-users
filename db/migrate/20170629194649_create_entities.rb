class CreateEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :entities do |t|
      t.string :login
      t.string :email
      t.string :type

      t.timestamps
    end
    add_index :entities, :login, unique: true
    add_index :entities, :email, unique: true
  end
end
