class User < Entity
  has_and_belongs_to_many :teams, join_table: 'teams_users'
end
