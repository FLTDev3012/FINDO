class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :wishlists_tag
  has_many :wishlists_gifts, dependent: :destroy
  has_many :gifts, through: :wishlists_gifts
  has_many :wishlists_tags, dependent: :destroy
  has_many :tags, through: :wishlists_tags
end
