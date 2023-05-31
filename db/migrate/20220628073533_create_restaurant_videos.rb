class CreateRestaurantVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_videos do |t|

      t.timestamps
    end
  end
end
