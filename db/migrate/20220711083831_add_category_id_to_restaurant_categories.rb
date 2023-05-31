class AddCategoryIdToRestaurantCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurant_categories, :category_id, :integer
  end
end
