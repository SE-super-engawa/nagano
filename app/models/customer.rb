class Customer < ApplicationRecord

has_many :shipping_address, dependent: :destroy
has_many :orders, dependent: :destroy
has_many :cart_items, dependent: :destroy

validates :family_name, :first_name, :family_name_kana, :first_name_kana,:postal_code, :address, :phone_number, presence: true
validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
validates :phone_number, numericality: { only_integer: true }
validates :family_name_kana, :first_name_kana,
format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい"}
  
def active_for_authentication?
  super && (self.is_deleted == false)
end

devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
