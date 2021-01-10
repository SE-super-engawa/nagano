class Product < ApplicationRecord
    belongs_to :genre
    # has_one :image, dependent: :destroy
    attachment :image
end
