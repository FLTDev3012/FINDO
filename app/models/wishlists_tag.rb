class WishlistsTag < ApplicationRecord
  belongs_to :tag
  belongs_to :wishlist
end
