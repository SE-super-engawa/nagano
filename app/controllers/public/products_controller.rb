class Public::ProductsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]     #ログインしてない人は閲覧のみ

  def index
    @genres = Genre.all
    @products = Product.all.page(params[:page]).per(8)     #もし販売中の商品のみ１ページにつき８個表示なら= Product.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.all
    @cart_item = CartItem.new

  end

  private
  def product_params
    params.require(:product).permit(:name, :image_id, :description, :price, :is_active, :genre_id)
  end

end
