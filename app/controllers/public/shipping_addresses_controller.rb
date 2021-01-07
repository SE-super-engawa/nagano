class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
