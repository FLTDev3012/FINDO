class AddImagePathToTags < ActiveRecord::Migration[7.0]
  def change
    add_column :tags, :image_path, :string
  end
end
