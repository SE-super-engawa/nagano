class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "admin/customers" && path[:action] == "show"
      @orders = Order.where(customer_id: path[:id])
      @orders = @orders.page(params[:page])
    else
      @orders = Order.page(params[:page]).reverse_order
    end
  end

  def show
    @order = Order.find(params[:id])
    @total_price = 0
    @order_products = @order.order_products
    @order_products.each do |order_product|
      @total_price += order_product.price*order_product.quantity
    end
    @invice_fee = @total_price + @order.shipping_fee
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.status == "payment_confirmation"
      order.order_products.each {|order_product|
      order_product.update(making_status: "製作待ち")
      }
    end
    redirect_back(fallback_location: root_path)
  end

  def order_params
    params.require(:order).permit(:status)
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

end
