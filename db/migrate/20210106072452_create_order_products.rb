class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :price
      t.integer :quantity
      t.integer :making_status

      t.timestamps
    end
  end
end
