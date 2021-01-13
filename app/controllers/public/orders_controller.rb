class Public::OrdersController < ApplicationController

 before_action :authenticate_customer!

  def new
    @customer = current_customer
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def confirm
    @cart_items = current_customer.cart_items

    params[:order][:payment] = params[:order][:payment].to_i #paymentの数値に変換
    @order = Order.new(order_params) #情報を渡している

    #分岐
    if params[:order][:addresses] == "residence"          #自身の住所が選択された時
      @order.postal_code = current_customer.postal_code   #自身の郵便番号をorderの郵便番号に入れる
      @order.address = current_customer.address           #自身の住所をorderの住所に入れる
      @order.name = current_customer.family_name+current_customer.first_name #自身の宛名をorderの宛名に入れる

    elsif params[:order][:addresses] ==  "shipping_addresses" #登録済住所が選択された時
      ship = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.postal_code = ship.postal_code
      @order.address     = ship.address
      @order.name        = ship.name

    elsif params[:order][:addresses] ==  "new_address" #新しいお届け先が選択された時
      @shipping_address = ShippingAddress.new()
      @shipping_address.postal_code = params[:order][:postal_code]
      @shipping_address.address     = params[:order][:address]
      @shipping_address.name        = params[:order][:name]
      @shipping_address.customer_id = current_customer.id
      if @shipping_address.save
        @order.postal_code = @shipping_address.postal_code #上記で代入された郵便番号をorderに代入
        @order.name = @shipping_address.name #上記で代入された宛名をorderに代入
        @order.address = @shipping_address.address #上記で代入された住所をorderに代入
      else
        @shipping_addresses = ShippingAddress.where(customer: current_customer)
        flash.now[:danger] = "住所を正しく入力してください。郵便番号はハイフンを入れず、7桁でお願いします。"
        render :new
      end
    end
  end

  def create
    @cart_items = current_customer.cart_items
    params[:order][:payment] = params[:order][:payment].to_i #paymentの数値に変換
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id #自身のidを代入
    if @order.save
      @cart_items.each do |cart_item|
        order_product = OrderProduct.new(order_id: @order.id, product_id: cart_item.product.id, price: cart_item.product.price, quantity: cart_item.quantity, making_status: 0)
        order_product.save
      end
      # オーダー確定後ユーザーのカートを削除する
      @cart_items.destroy_all
      flash[:success] = "ご注文が確定しました。"
      redirect_to orders_thanks_path
    else
      @order.customer_id = current_customer.id
      render :new
    end

  end

  def thanks
    # サンクスページの表示のみ
  end

  def index
    @order = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

   private
    def order_params
      params.require(:order).permit(  :customer_id,
                                      :postal_code,
                                      :address,
                                      :name,
                                      :shipping_fee,
                                      :total_price,
                                      :payment,
                                      :status,
                                      order_products_attributes: [:product_id, :quantity, :price])
    end

    def shipping_address_params
      params.require(:order).permit(:address, :name, :postal_code, :customer_id)
    end
end
