class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer

  validates :product_id, :customer_id, :quantity, :image_id, :is_active, presence: true
	validates :quantity, numericality: { only_integer: true }

end
