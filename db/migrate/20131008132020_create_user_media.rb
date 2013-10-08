class CreateUserMedia < ActiveRecord::Migration
  def change
    create_table :user_media do |t|

      t.timestamps
    end
  end
end
