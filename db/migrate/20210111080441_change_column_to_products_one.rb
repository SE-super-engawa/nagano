class ChangeColumnToProductsOne < ActiveRecord::Migration[5.2]
    def up
      change_column :products, :is_active, :boolean, default:"TRUE"
    end
  
    # 変更前の状態
    def down
      change_column :products, :is_active, :boolean, default:"TRUE"
    end
end
