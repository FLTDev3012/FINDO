class CreateGiftsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts_tags do |t|
      t.references :gift, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
