class AddVoteDefaultToWishlistsGift < ActiveRecord::Migration[7.0]
  def change
    change_column_default :wishlists_gifts, :vote, 0
  end
end
