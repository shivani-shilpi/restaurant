class AddRestaurantIdToRestaurantVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurant_videos, :restaurant_id, :integer
  end
end
