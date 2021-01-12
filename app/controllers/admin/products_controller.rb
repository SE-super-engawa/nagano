class Admin::ProductsController < ApplicationController

  # before_action :if_not_admin

  def index
    @products = Product.all
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
     @product =Product.new(product_params)

     if @product.save
     redirect_to admin_product_path(@product.id)
    else

     render :index
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      render :index
    end
  end

 private
  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :is_active, :genre_id)
  end

  # def if_not_admin
  #   redirect_to homes_path unless current_customer.admin?
  # end


end
