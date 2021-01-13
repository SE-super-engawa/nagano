class Admin::OrderProductsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def update
    order_product = OrderProduct.find(params[:id])
    order_product.update(order_product_params)
    redirect_back(fallback_location: root_path)
  end
  
  def order_product_params
    params.require(:order_product).permit(:making_status)
  end

  
end
