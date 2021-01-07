Rails.application.routes.draw do

  namespace :public do
    get '/', to: 'homes#top'
  end

  namespace :public do
    get '/about', to: 'homes#about'
  end

  devise_for :admins

  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
