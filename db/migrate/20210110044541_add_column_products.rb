class AddColumnProducts < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :genre_id, :integer
  end

  def down
    remove_column :products, :genre_id, :integer
  end
end
