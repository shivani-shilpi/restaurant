class AddPositionToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :position, :integer
    Restaurant.order(:updated_at).each.with_index(1) do |restaurant, index|
      restaurant.update_column :position, index
    end
  end
end
