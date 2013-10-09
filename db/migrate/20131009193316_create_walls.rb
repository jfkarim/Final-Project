class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.references :wallable, polymorphic: true

      t.timestamps
    end

    add_index :walls, [:wallable_type, :wallable_id]
  end
end
