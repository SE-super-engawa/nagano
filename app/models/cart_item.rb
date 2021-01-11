class CartItem < ApplicationRecord

  belongs_to :product, dependent: :destroy
  belongs_to :customer, dependent: :destroy

  validates :product_id, :customer_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }

	def self.sumprice        #priceカラムの合計値
	  sum(:price)
	end

end
