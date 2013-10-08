class CreateUserMedia < ActiveRecord::Migration
  def change
    create_table :user_media do |t|
      t.integer :medium_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :user_media, :user_id
    add_index :user_media, :medium_id
    add_index :user_media, [:user_id, :medium_id]
  end

end
