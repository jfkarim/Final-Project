class AddFontAndColorToPostTable < ActiveRecord::Migration
  def change
    add_column :posts, :font, :string
    add_index :posts, :font
    add_column :posts, :color, :string
    add_index :posts, :color
  end
end
