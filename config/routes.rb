Rails.application.routes.draw do



  devise_for :admins

  devise_for :customers

   namespace :admin do
    resources :genres, except:[:new, :show, :destroy]
    resources :products,only: [:index, :show, :new, :create, :edit, :update]
  end



end
