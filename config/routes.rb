Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :carts, only: [:show, :edit, :update] do
      resources :orders, only: [:show]
    end
  end

  resources :items, only: [:show]
  root "static_pages#index"

  resources :users, only: [:show] do
    resources :carts, only: [:show, :edit, :update]
  end

  resources :items, only: [:show]
end
