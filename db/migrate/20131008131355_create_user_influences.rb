class CreateUserInfluences < ActiveRecord::Migration
  def change
    create_table :user_influences do |t|

      t.timestamps
    end
  end
end
