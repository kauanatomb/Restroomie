class Restroom < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :name, :address, presence: true
end
