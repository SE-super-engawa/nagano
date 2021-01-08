class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :password
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
