class User < Entity
  has_and_belongs_to_many :teams, join_table: 'teams_users'

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :login, presence: true, uniqueness: { case_sensitive: false }
end
