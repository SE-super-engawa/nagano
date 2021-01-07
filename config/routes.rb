Rails.application.routes.draw do
  
  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
  end

end
