Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'home/index'
    resources :admins
    resources :genres
    resources :artists
    resources :livestreams
    resources :artist_lives
  end
  devise_for :users
  devise_for :admins
  namespace :site do
    get 'home/index'
    get 'inicio', to: 'home#index'
  end
  namespace :users_backoffice do
    get 'home/index'
  end
  
  root to: 'site/home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
