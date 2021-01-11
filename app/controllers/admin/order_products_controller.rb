class Admin::OrderProductsController < ApplicationController
  def update
  end
  
  def order_products_params
    params.require(:order_product).permit(:making_status)
  end
  
end
