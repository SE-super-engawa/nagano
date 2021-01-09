class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
    @shipping_addresses = ShippingAddress.where(customer: current_customer)
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total_price = 0

    params[:order][:payment] = params[:order][:payment].to_i #payment_methodの数値に変換
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
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
      @ship = "1"
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to thanks_customers_orders_path

    # もし情報入力でnew_addressの場合ShippingAddressに保存
    if params[:order][:ship] == "1"
      current_customer.shipping_address.create(shipping_address_params)
    end

    # オーダー確定後ユーザーのカートを削除する
    current_customer.cart_items.destroy_all

  end

  def thanks
    # サンクスページの表示のみ
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
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
                                      order_products_attributes: [:price, :quantity, :product_id])
    end

    def shipping_address_params
      params.permit(:address, :name, :postal_code, :customer_id)
    end
end
