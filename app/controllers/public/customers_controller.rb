class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer! #ログインしていないとログインページにリダイレクトさせる

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
	  if @customer.update(customer_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def check

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
  end

  private

	def customer_params
  	params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :phone_numbar, :email, :address)
  end

end
