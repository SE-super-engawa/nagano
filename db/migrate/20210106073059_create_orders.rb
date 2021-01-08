class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_fee
      t.integer :total_price
      t.integer :payment
      t.integer :status

      t.timestamps
    end
  end
end
