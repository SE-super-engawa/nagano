class AddNotnullToCartItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cart_items, :product_id, false
    change_column_null :cart_items, :customer_id, false
    change_column_null :cart_items, :quantity, false
  end
end
