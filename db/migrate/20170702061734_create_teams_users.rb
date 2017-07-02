class CreateTeamsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :teams_users do |t|
      t.integer :team_id
      t.integer :user_id

      t.string :role  # owner/member

      t.timestamps
    end

    add_index :teams_users, [:team_id, :user_id], unique: true
  end
end
