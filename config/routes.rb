Rails.application.routes.draw do
  root "static_pages#index"
  #get "static_pages/index"

  resources :cart, only: [:update, :destroy]

  devise_for :users

  resources :users, only: [:show] do
    resources :carts, only: [:show, :edit, :update]
  end

  resources :items, only: [:show]
end
