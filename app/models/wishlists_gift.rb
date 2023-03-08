class WishlistsGift < ApplicationRecord
  belongs_to :gift
  belongs_to :wishlist
  has_many :votes, dependent: :destroy
end
