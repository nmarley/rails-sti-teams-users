class TeamUser < ActiveRecord::Base
  self.table_name = :teams_users
  belongs_to :team
  belongs_to :user

  validates :role, presence: true, in: %w[owner member]
end
