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
    @order = Order.find(params[:id])
    @total_price = 0
   
    @invice_fee = @total_price + @order.shipping_fee
  end
  
  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_path
    end  
  end
  
  def order_params
    params.permit(:status)
  end
  
end
