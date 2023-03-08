class CreateWishlistsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :wishlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
