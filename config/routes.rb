Rails.application.routes.draw do

  # get 'genres/create'
  # get 'genres/index'
  # get 'genres/edit'
  # get 'genres/update'
  scope module: :public do
    resources :shipping_addresses, except:[:new, :show]
  end
  
  namespace :admin do
    resources :genres, except:[:new, :show, :destroy]
  end
  
  devise_for :admins

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
