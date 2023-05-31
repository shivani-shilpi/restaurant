class AddRestaurantIdToRestaurantCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurant_categories, :restaurant_id, :integer
  end
end
