class CreateUserInfluences < ActiveRecord::Migration
  def change
    create_table :user_influences do |t|
      t.integer :influence_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :user_influences, :user_id
    add_index :user_influences, :influence_id
    add_index :user_influences, [:user_id, :influence_id]
  end

end
