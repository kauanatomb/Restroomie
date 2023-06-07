class Restroom < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :reviews
end
