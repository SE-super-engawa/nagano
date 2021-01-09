class Admin::OrdersController < ApplicationController

  def index
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "admins/customers" && path[:action] == "show"
      @orders = Order.where(customer_id: path[:id])
    else
      @orders = Order.page(params[:page]).reverse_order
    end
  end
  
  def show
    @order = Order(params[:id])
    @total_price = 0
    @order.order_products each do |order_product|
      @total_price += order_product.price*order_product.quantity
    end
  end

  def update
  end
end
