class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :themes, :name
  end

end
