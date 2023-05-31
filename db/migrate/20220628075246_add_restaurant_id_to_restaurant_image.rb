class AddRestaurantIdToRestaurantImage < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurant_images, :restaurant_id, :integer
  end
end
