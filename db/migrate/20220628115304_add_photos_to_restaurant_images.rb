class AddPhotosToRestaurantImages < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurant_images, :photos, :string
  end
end
