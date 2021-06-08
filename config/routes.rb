Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :carts, only: [:show, :edit, :update]
  end

  resources :items, only: [:show,:destroy]
  
  root "static_pages#index"

  post '/orders', to: 'orders#create'
  get '/team', to: 'static_pages#team'

  namespace :admin do
    root 'admin#index'
    resources :users
    resources :admin, only: :index
    resources :items
    resources :carts
    resources :orders
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
