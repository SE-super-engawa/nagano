class Admin::ProductsController < ApplicationController

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
    # @product.genre_id = @product_id
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
    end
  end

 private
  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :is_active, :genre_id)
  end


end