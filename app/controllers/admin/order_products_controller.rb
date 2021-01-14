class Admin::OrderProductsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def update
    order_product = OrderProduct.find(params[:id])
    order_product.update(order_product_params)
    order_products =order_product.order.order_products
    if order_products.any? {|order_product| order_product.making_status == "製作中"} == true 
      order_product.order.update(status: "in_production")
    elsif order_products.all? {|order_product| order_product.making_status == "製作完了"} == true 
      order_product.order.update(status: "preparing_ship")
    end
    redirect_back(fallback_location: root_path)
  end
  
  def order_product_params
    params.require(:order_product).permit(:making_status)
  end

  
end
