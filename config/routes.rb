Rails.application.routes.draw do

  scope module: :public do
    resources :shipping_addresses, except:[:new, :show]
  end

  devise_for :admins

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
