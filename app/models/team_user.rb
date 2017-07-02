class TeamUser < ActiveRecord::Base
  self.table_name = :teams_users
  belongs_to :team
  belongs_to :user

  scope :owner, -> { where(role: 'owner') }
  scope :member, -> { where(role: 'member') }

  validates :role, inclusion: { in: %w[owner member] }
end
