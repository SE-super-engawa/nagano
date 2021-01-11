class Public::HomesController < ApplicationController
  def top
    @products = Product.limit(4).order(created_at:  :DESC)      #:DESC => 新着順に4つの商品を取り出す
  end

  def about
  end
end
