class AddPositionToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :position, :integer
    Menu.order(:updated_at).each.with_index(1) do |menu, index|
      menu.update_column :position, index
    end
  end
end
