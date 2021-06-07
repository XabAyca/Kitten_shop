Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:show] do
    resources :carts, only: [:show,:edit,:update] do
      resources :orders, only: [:show]
    end
  end

  resources :items, only: [:show]  
  root "static_pages#index"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
