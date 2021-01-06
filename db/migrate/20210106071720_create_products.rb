class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_id
      t.text :description
      t.integer :price
      t.boolean :is_active

      t.timestamps
    end
  end
end
