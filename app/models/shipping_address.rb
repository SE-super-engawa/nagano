class ShippingAddress < ApplicationRecord
  belongs_to :customer
  validates :postal_code, presence: true, length: { is: 7 }, numericality: { only_integer: true }
  validates :address, presence: true
  validates :name, presence: true

  # order/newで使用
	def order_address
		"〒" + self.postal_code + self.address + self.name
	end

end