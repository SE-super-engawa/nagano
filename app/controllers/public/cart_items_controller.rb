class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(params_cart_item)
    @update_cart_item = CartItem.find_by(product_id: @cart_item.product.id, customer_id: current_customer.id)     #カート内商品の重複を避け、商品の合計個数を出す
    if @update_cart_item
      @update_cart_item.quantity += @cart_item.quantity
      @update_cart_item.save
      redirect_to products_path
    end
    p @cart_item
    if @cart_item.save
      flash[:notice] = "商品を入れました"
      redirect_to products_path
    else
      @product = Product.find(params[:cart_item][:product_id])
      @cart_item = CartItem.new
      flash[:notice] = "個数を選択してください"
      render "public/products/show"
    end
  end

  def update
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    flash.now[:success] = "#{@cart_item.product.name}の数量を変更しました"
    @cart_items = current_customer.cart_items
    @price = sumprice(@cart_item).to_s(:delimited)   #←ここも謎
    #@total = total_price(@cart_items).to_s(:delimited)   #税抜カラムのみで税込価格・小計・合計価格どうしよ・・・
    redirect_to customers_cart_items_path
  end

  def destroy
    @cart_item.destroy
    flash.now[:alert] = "#{@cart_item.product.name}を削除しました"
    @cart_items = current_cart
    #@total = total_price(@cart_items).to_s(:delimited)     #謎。
    redirect_to customers_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to customers_cart_items_path
  end

  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end