class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :requester_id
      t.integer :requested_id
      t.string :status

      t.timestamps
    end
    add_index :friend_requests, :requested_id
    add_index :friend_requests, :requester_id
  end
end
