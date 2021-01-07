Rails.application.routes.draw do

<<<<<<< HEAD
  namespace :public do
    get '/', to: 'homes#top'
  end

  namespace :public do
    get '/about', to: 'homes#about'
=======
  scope module: :public do
    resources :shipping_addresses, except:[:new, :show]
>>>>>>> 349708f418afb40e3f677eecab2cfe62ed14edba
  end

  devise_for :admins

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
