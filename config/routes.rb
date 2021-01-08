Rails.application.routes.draw do

  # get 'genres/create'

  devise_for :admins

  devise_for :customers
  
   namespace :admin do
    resources :genres, except:[:new, :show, :destroy]
  end

 
end
