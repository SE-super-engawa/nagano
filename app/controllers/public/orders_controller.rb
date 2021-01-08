class Public::OrdersController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def thanks
    # サンクスページの表示のみ
  end

  def confirm
  end
end
