Rails.application.routes.draw do
<<<<<<< HEAD
  root "static_pages#index"
  #get "static_pages/index"

  resources :cart, only: [:update, :destroy]

||||||| 16ee47c
  get 'user/show'
  get 'item/show'
  root "static_pages#index"
  #get "static_pages/index"
=======
>>>>>>> development
  devise_for :users
  
  resources :users, only: [:show] do
    resources :carts, only: [:show,:edit,:update] do
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
