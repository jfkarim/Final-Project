class CreateInfluences < ActiveRecord::Migration
  def change
    create_table :influences do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :influences, :name
  end

end
