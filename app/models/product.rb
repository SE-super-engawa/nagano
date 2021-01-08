class Product < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_products, dependent: :destroy
  belongs_to :genres, dependent: :destroy

end
