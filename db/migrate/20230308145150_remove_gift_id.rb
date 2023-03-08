class RemoveGiftId < ActiveRecord::Migration[7.0]
  def change
    remove_column :wishlists, :gift_id
  end
end
