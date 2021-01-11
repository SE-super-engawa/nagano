class Public::ProductsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]     #ログインしてない人は閲覧のみ

  def index
    @genres = Genre.all
    @products = Product.all.page(params[:page]).per(8)   #もし販売中の商品のみ１ページにつき８個表示なら= Product.where(is_active: true).page(params[:page]).per(8)

    #税込価格を表示
    @products.each do |product|
    @tax_price = product.price*1.1
    end
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.all
    @cart_item = CartItem.new

    #税込価格を表示
    @products.each do |product|
    @tax_price = product.price*1.1
    end


  end

  private
  def product_params
    params.require(:product).permit(:name, :image_id, :description, :price, :is_active, :genre_id)
  end

end
