class Restroom < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  has_one_attached :photo
  validates :name, :address, presence: true
  attribute :hygiene_products, :string
  attribute :cleanliness, :integer
end
