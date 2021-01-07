class ChangeColumnToSippingAddress < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    change_column :shipping_addresses, :postal_code, :string, null: false
  end

  # 変更前の状態
  def down
    change_column :shipping_addresses, :postal_code, :string, null: false, limit: 7
  end
end
