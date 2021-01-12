class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(params_cart_item)   #カート内商品の重複を避け、商品の合計個数を出す
    @update_cart_item = CartItem.find_by(product_id: @cart_item.product.id, customer_id: current_customer.id)
    if not params[:cart_item][:quantity].empty? == true              #すでにカート内にある商品、尚且つ個数選択していない場合
    if @update_cart_item                                             #すでにカート内にある商品を追加する場合
      @cart_item.quantity += @update_cart_item.quantity
      @update_cart_item.destroy                                      #重複した商品項目の消去
    end
    end
    if @cart_item.save
      flash[:success] = "#{@cart_item.product.name}を入れました"
      redirect_to cart_items_path
    else
      @product = Product.find(params[:cart_item][:product_id])       #個数選択をせずに”カートに入れる”ボタンを押した場合
      @cart_item = CartItem.new
      flash.now[:danger] = "個数を選択してください"
      render "public/products/show"
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    flash[:success] = "#{@cart_item.product.name}の数量を変更しました"
    @cart_items = current_customer.cart_items
    redirect_to cart_items_path
  end

  def destroy
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:info] = "#{@cart_item.product.name}を削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash.now[:info] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end