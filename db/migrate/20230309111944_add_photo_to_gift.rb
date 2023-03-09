class AddPhotoToGift < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :photo, :string
  end
end
