class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      redirect_to shipping_addresses_path, success:"新しい配送先を登録しました。"
    else
      @shipping_addresses = ShippingAddress.all
      render :index
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
	  if @shipping_address.update(shipping_address_params)
  	 flash[:success] = "配送先を変更しました"
     redirect_to shipping_addresses_path
	  else
	   render "edit"
	  end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
	  @shipping_address.destroy
    flash[:info] = "配送先を削除しました"
	  redirect_to shipping_addresses_path
  end

  private

	def shipping_address_params
  	params.require(:shipping_address).permit(:postal_code, :address, :name)
  end

end
