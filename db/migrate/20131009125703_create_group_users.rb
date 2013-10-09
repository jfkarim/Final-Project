class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.integer :group_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :group_users, :group_id
    add_index :group_users, :user_id
    add_index :group_users, [:user_id, :group_id]
  end
end
