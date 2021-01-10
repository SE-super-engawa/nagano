Rails.application.routes.draw do



  get 'admin' => 'homes#top', as: 'homes'
  get 'sessions/new'
  get 'sessions/crete'
  get 'sessions/destroy'

  devise_for :admin

  devise_for :customers

   namespace :admin do
    resources :genres, except:[:new, :show, :destroy]
    resources :products,only: [:index, :show, :new, :create, :edit, :update]
  end



end
