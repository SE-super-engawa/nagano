class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

<<<<<<< HEAD
  # ログイン後のリダイレクト先
=======
>>>>>>> 4bc745fe96be7f5d39439554ff36f88ff5a20f67
  def after_sign_in_path_for(resource)
    customers_my_page_path
  end

<<<<<<< HEAD

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end


=======
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end

>>>>>>> 4bc745fe96be7f5d39439554ff36f88ff5a20f67
end
