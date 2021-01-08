class AddNotnullOnShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :shipping_addresses, :customer_id, :integer
    change_column_null :shipping_addresses, :postal_code, false
    change_column_null :shipping_addresses, :address, false
    change_column_null :shipping_addresses, :name, false
  end
end
