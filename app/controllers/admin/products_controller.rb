class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new

  end

  def create
     @product =Product.new(product_params)
    # @genre = Genre.find(params[:id])
     if @product.save
     redirect_to admin_product_path(product.id)
    else
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_product_path
    else
    end
  end

 private
  def product_params
    params.permit(:name,:image, :description, :price, :is_active)
  end

end
