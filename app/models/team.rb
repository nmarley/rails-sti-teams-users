class Team < Entity
  has_and_belongs_to_many :users, join_table: :teams_users

  #has_many :teams_users, class_name: 'Entity'
  #has_many :users, class_name: 'Entity', through: :teams_users, source: :users

  # default repo permission
  # admin write read none
end
