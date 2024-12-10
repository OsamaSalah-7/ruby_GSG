class Project < ApplicationRecord
  belongs_to :user
  has_one :board, dependent: :destroy
  has_many :teams
  has_many :tasks, through: :board
  validates :name, presence: true
end
