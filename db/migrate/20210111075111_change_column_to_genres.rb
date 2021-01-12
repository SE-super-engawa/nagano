class ChangeColumnToGenres < ActiveRecord::Migration[5.2]
      # 変更内容
  def up
    change_column :genres, :is_active, :boolean, default:"TRUE"
  end

  # 変更前の状態
  def down
    change_column :genres, :is_active, :boolean, default:"TRUE"
  end
end
