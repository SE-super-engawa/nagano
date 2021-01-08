class ShippingAddress < ApplicationRecord
  # belongs_to :customer
  validates :postal_code, presence: true, length: { is: 7 }, numericality: { only_integer: true }
end
