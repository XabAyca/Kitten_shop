Rails.application.routes.draw do
  root "static_pages#index"
  #get "static_pages/index"

  resources :user, only: [:show]
  resources :item, only: [:show]
  resources :cart, only: [:create, :destroy]

  #devise_for :users, controllers: { sessions: "users/sessions",}
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
