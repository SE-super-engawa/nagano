Rails.application.routes.draw do

  devise_for :admins

  devise_for :customers, controllers: {
    sessions: 'public/customers/sessions',
    passwords: 'public/customers/passwords',
    registrations: 'public/customers/registrations'
  }

  namespace :public do
    get '/', to: 'homes#top'
    get '/about', to: 'homes#about'
  end

  scope module: :public do
    resources :shipping_addresses, except:[:new, :show]
    resource :customers, only: [:edit, :update]
    get 'customers/my_page', to: 'customers#show'
    get 'customers/check', to: 'customers#check'
    patch 'customers/withdraw', to: 'customers#withdraw'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
