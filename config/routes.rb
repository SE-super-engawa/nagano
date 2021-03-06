Rails.application.routes.draw do

  namespace :admin do
    resources :orders, only:[ :index, :show,:update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :order_products, only:[:update]
    resources :genres, except:[:new, :show, :destroy]
    resources :products,only: [:index, :show, :new, :create, :edit, :update]
  end
  # get '/admin' => 'admin/sessions#new', as: 'homes'

  get 'sessions/new'
  get 'sessions/crete'
  get 'sessions/destroy'

  devise_scope :admin do
    get 'admin' => 'admin/sessions#new' , as: 'homes'
    post 'admin' => 'admin/sessions#create'
    delete 'admin' => 'admin/sessions#destro'
  end

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
    resource :customers, only: [:update]
    get 'customers/my_page/edit' => 'customers#edit', as: 'my_page_edit'

    get 'orders/thanks', to: 'orders#thanks'          #resources :orderより前に記載必須
    post 'orders/confirm', to: 'orders#confirm'       #resources :orderより前に記載必須
    resources :orders, only: [:new, :index, :show, :create]
  end


end
