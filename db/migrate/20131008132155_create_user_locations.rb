class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.integer :user_id, null: false
      t.integer :location_id, null: false

      t.timestamps
    end
    add_index :user_locations, :user_id
    add_index :user_locations, :location_id
    add_index :user_locations, [:user_id, :location_id]
  end
end
