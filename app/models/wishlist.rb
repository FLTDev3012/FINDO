class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :wishlists_tag
end
