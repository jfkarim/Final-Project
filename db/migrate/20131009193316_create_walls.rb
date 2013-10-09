class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.integer :owner_id

      t.timestamps
    end
  end
end
