class CreateUserThemes < ActiveRecord::Migration
  def change
    create_table :user_themes do |t|
      t.integer :theme_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :user_themes, :user_id
    add_index :user_themes, :theme_id
    add_index :user_themes, [:user_id, :theme_id]
  end

end
