class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :wishlists_tag
  has_many :wishlists_gifts
  has_many :gifts, through: :wishlists_gifts
end
