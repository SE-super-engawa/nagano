class AddOptionsToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :customer_id, :integer, null: false
    change_column :orders, :postal_code, :string,  null: false
    change_column :orders, :address, :string, null: false
    change_column :orders, :name, :string, null: false
    change_column :orders, :shipping_fee, :integer,  null: false, default: 800
    change_column :orders, :total_price, :integer, null: false
    change_column :orders, :payment, :integer,  null: false, limit: 1
    change_column :orders, :status, :integer, null: false, limit: 1
  end
end
