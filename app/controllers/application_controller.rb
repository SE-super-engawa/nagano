class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    customers_my_page_path
  end

  # def after_sign_in_path_for(resource)
  #   admin_orders_path
  # end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end

end
