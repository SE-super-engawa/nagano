class Admin::CustomersController < ApplicationController
  
  # before_action :if_not_admin #
  
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer)
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address , :phone_number, :email, :is_deleted)
  end
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
   
  
end
