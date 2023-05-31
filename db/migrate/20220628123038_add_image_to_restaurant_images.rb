class AddImageToRestaurantImages < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurant_images, :image, :string
  end
end
