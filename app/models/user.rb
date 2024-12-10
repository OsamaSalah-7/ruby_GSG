class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :projects
  has_many :tasks
  has_many :team_members
  has_many :teams, through: :team_members
end
