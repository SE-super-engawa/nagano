# frozen_string_literal: true

class Public::Customers::SessionsController < Devise::SessionsController
  # before_action :reject_customer, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

<<<<<<< HEAD
#   def after_sign_in_path_for(resource)
#     customers_my_page_path
# end
=======

>>>>>>> 4bc745fe96be7f5d39439554ff36f88ff5a20f67

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # protected

  # def reject_customer
  #   @customer = Customer.find_by(email: params[:custmer][:email].downcase)
  #   if @customer
  #     if (@customer.valid_password?(params[:custmer][:password]) && (@custmer.active_for_authentication? == false))
  #       flash[:error] = "退会済みです。"
  #       redirect_to new_user_session_path
  #     end
  #   else
  #     flash[:error] = "必須項目を入力してください。"
  #   end
  # end
end
