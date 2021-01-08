class AddOptionShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :shipping_addresses, :postal_code, :string, null: false, limit: 7
  end
end
