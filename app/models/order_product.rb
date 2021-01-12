class OrderProduct < ApplicationRecord

belongs_to :product
belongs_to :order

enum making_status:{
cannot_be_manufactured: 0,#着手不可
waiting_for_production: 1,#製作待ち
in_production: 2,#製作中
production_completed: 3,#製作完了
}
end