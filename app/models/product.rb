class Product < ApplicationRecord

    belongs_to :genre,  dependent: :destroy
    attachment :image

  has_many :cart_items, dependent: :destroy
  has_many :order_products, dependent: :destroy
  
#   enum status:{
#       true: 0, #販売中
#       false: 1, #販売停止中
#   }
   
   
   
end
