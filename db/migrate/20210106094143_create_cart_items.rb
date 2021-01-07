class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :quantity
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
