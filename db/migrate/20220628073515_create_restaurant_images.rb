class CreateRestaurantImages < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_images do |t|

      t.timestamps
    end
  end
end
