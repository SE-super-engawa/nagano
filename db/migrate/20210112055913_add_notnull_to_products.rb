class AddNotnullToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :image_id, false
    change_column_null :products, :description, false
    change_column_null :products, :price, false
    change_column_null :products, :genre_id, false
  end
end
