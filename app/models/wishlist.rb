class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :gift
  has_many :tags, through: :wishlists_tag
end
