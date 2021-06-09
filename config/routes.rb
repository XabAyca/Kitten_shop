Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :avatars, only: [:create, :update]
    resources :carts, only: [:show, :edit, :update]
  end

  resources :items, only: [:show, :destroy] do
    resources :item_images, only: [:create, :update]
  end

  root "static_pages#index"

  post "/orders", to: "orders#create"
  get "/team", to: "static_pages#team"

  ### Admin routes ###
  namespace :admin do
    root "admin#index"
    resources :users, only: [:index, :destroy, :update]
    resources :admin, only: [:index]
    resources :items, except: [:show]
    resources :orders, only: [:index, :destroy]
  end
end
