class CreateWishlistsGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists_gifts do |t|
      t.integer :vote
      t.references :gift, null: false, foreign_key: true
      t.references :wishlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
