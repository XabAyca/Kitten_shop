Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show], path: 'utilisateur' do
    resources :avatars, only: [:create, :update]
    resources :carts, only: [:show, :edit, :update], path: 'panier'
  end

  resources :items, only: [:show, :destroy], path: 'produit'do
    resources :item_images, only: [:create, :update]
  end

  root "static_pages#index"

  post "/orders", to: "orders#create"
  get "/team", to: "static_pages#team"

  resources :orders, only: [:show]
  ### Admin routes ###
  namespace :admin do
    root "admin#index"
    resources :users, only: [:index, :destroy, :update]
    resources :admin, only: [:index]
    resources :items, except: [:show]
    resources :orders, only: [:index, :destroy]
  end
end
