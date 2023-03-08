class Tag < ApplicationRecord
  has_many :gifts_tag
  has_many :Wishlists_tag
end
