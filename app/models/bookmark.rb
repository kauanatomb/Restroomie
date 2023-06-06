class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :restroom
  has_many :bookmarks
end
