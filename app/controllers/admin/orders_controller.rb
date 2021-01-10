class Admin::OrdersController < ApplicationController

  # before_action :if_not_admin #
  
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

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
  
end
