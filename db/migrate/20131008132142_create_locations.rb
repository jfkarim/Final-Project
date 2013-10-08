class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city, null: false
      t.string :country, null: false

      t.timestamps
    end
    add_index :locations, :city
    add_index :locations, :country
  end
end
