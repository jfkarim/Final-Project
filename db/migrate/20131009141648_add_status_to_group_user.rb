class AddStatusToGroupUser < ActiveRecord::Migration
  def change
    add_column :group_users, :status, :string
  end
end
