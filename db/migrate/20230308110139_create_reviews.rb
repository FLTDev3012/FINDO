class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true
      t.timestamps
    end
  end
end
