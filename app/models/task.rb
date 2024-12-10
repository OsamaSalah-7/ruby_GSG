class Task < ApplicationRecord
  belongs_to :board
  belongs_to :category
  belongs_to :user, optional: true
  validates :title, presence: true
end
