class Product < ApplicationRecord

    belongs_to :genre
    # has_one :image, dependent: :destroy
    attachment :image

  has_many :cart_items, dependent: :destroy
  has_many :order_products, dependent: :destroy
#   belongs_to :genres, dependent: :destroy

end
