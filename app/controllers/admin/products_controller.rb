class Admin::ProductsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @products = Product.all
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
     @product =Product.new(product_params)
     if @product.save
       flash[:success] = "商品を追加しました"
       redirect_to admin_product_path(@product.id)
    else
       flash.now[:danger] = "商品の追加に失敗しました"
       render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "商品を変更しました"
      redirect_to admin_product_path(@product.id)
    else
      flash.now[:danger] = "商品の変更に失敗しました"
      @products = Product.all
      render :edit
    end
  end

 private
  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :is_active, :genre_id)
  end



end
