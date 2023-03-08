class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.float :price
      t.string :description
      t.float :rating
      t.string :url
      t.integer :vote

      t.timestamps
    end
  end
end
