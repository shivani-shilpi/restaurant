class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :contact
      t.string :full_address
      t.integer :user_id

      t.timestamps
    end
  end
end
