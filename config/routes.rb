Rails.application.routes.draw do

  scope module: :public do
    resources :shipping_addresses, except:[:new, :show]
    resource :customers, only: [:edit, :update]
    get 'customers/my_page', to: 'customers#show'
    get 'customers/check', to: 'customers#check'
    patch 'customers/withdraw', to: 'customers#withdraw'
    resources :orders, only: [:new, :index, :show, :create]
    get 'orders/thanks', to:'orders#thanks'
    post 'orders/confirm', to:'orders#confirm'
  end

  devise_for :admins

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
