class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :wall_id
      t.text :content
      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :wall_id
    add_index :posts, [:wall_id, :user_id]
  end
end
