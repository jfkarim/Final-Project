class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :admin_id
      t.text :description
      t.string :name
      t.text :address
      t.date :date
      t.time :time

      t.timestamps
    end

    add_index :events, :admin_id
  end
end
