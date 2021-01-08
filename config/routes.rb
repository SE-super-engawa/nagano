Rails.application.routes.draw do

  devise_for :admins

  devise_for :customers, controllers: {
    sessions: 'public/customers/sessions',
    passwords: 'public/customers/passwords',
    registrations: 'public/customers/registrations'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'

    resources :products, only: [:index, :show]

    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]

    resources :shipping_addresses, except:[:new, :show]

    get 'customers/my_page', to: 'customers#show'         #resource :customersより前に記載必須
    get 'customers/check', to: 'customers#check'          #resource :customersより前に記載必須
    patch 'customers/withdraw', to: 'customers#withdraw'  #resource :customersより前に記載必須
    resource :customers, only: [:edit, :update]

    get 'orders/thanks', to: 'orders#thanks'          #resources :orderより前に記載必須
    post 'orders/confirm', to: 'orders#confirm'       #resources :orderより前に記載必須
    resources :orders, only: [:new, :index, :show, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
