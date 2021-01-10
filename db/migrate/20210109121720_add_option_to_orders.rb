class AddOptionToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :status, :integer, null: false, default: 0,limit: 1
  end
end
