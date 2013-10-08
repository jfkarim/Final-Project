class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :admin_id
      t.string :name
      t.text :description

      t.timestamps
    end

    add_index :groups, :admin_id
  end
end
