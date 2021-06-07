Rails.application.routes.draw do
  get 'user/show'
  get 'item/show'
  root "static_pages#index"
  #get "static_pages/index"
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
