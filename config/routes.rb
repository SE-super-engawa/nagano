Rails.application.routes.draw do

  scope module: :public do
    resources :shipping_addresses, except:[:new, :show]

    get 'customers/my_page', to: 'customers#show'
    get 'customers/check', to: 'customers#check'
    patch 'customers/withdraw', to: 'customers#withdraw'
    resource :customers, only: [:edit, :update]

    get 'orders/thanks', to: 'orders#thanks'          #resources :orderより前に記載必須
    post 'orders/confirm', to: 'orders#confirm'       #resources :orderより前に記載必須
    resources :orders, only: [:new, :index, :show, :create]
  end

  devise_for :admins

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
