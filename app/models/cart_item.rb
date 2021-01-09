class CartItem < ApplicationRecord

  belongs_to :products, dependent: :destroy
  belongs_to :customers, dependent: :destroy

  validates :product_id, :customer_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }

	def self.sumprice        #priceカラムの合計値
	  sum(:price)
	end

end
