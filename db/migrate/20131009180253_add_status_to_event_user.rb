class AddStatusToEventUser < ActiveRecord::Migration
  def change
    add_column :event_users, :status, :string
  end
end
