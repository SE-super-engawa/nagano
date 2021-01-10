class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end

end
