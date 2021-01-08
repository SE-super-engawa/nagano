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
  end

  def update
  end
end
