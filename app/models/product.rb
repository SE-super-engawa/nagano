class Product < ApplicationRecord

    belongs_to :genre,  dependent: :destroy
    attachment :image

  has_many :cart_items, dependent: :destroy
  has_many :order_products, dependent: :destroy
   
   
end
