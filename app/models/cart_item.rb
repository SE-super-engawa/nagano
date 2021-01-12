class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :customer

  validates :product_id, :customer_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }

	def self.sumprice        #priceカラムの合計値
	  sum(:price)
	end

end
