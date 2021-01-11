class Public::HomesController < ApplicationController
  def top
    @products = Product.limit(4).order(created_at:  :DESC)      #:DESC => 新着順に4つの商品を取り出す

    #税込価格を出す
    # @products.each do |product|
    # @tax_price = product.price*1.1
    # end

  end

  def about
  end
end
