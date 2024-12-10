class Team < ApplicationRecord
  belongs_to :project
  has_many :team_members
  has_many :users, through: :team_members
end
