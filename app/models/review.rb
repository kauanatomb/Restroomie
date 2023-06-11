class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restroom
  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :rating, presence: true
end
