class WishlistsGift < ApplicationRecord
  belongs_to :gift
  belongs_to :wishlist
  has_many :votes, dependent: :destroy


  def self.top_votes_for_wishlist_gift(id)
    WishlistsGift.where(wishlist_id: id).order("vote desc").limit(1).first
  end
end
