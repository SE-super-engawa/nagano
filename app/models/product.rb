class Product < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_products, dependent: :destroy
  belongs_to :genre, dependent: :destroy

  attachment :image

  validates :name, :genre_id, :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :description, length: {maximum: 200}


end
