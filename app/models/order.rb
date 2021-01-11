class Order < ApplicationRecord
belongs_to :customer
has_many :order_products, dependent: :destroy

enum payment:{
    credit_card: 0,   #クレジットカード
    bank_transfer: 1, #銀行振込
  }

enum status:{
    waiting_payment: 0,      #入金待ち
    payment_confirmation: 1, #入金確認
    in_production: 2,        #製作中
    preparing_ship: 3,       #発送準備中
    done_ship: 4,            #発送済み
  }

end
