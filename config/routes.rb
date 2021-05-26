Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/show'
  # creates all - GET POST PATCH PUT DELETE index create new edit show update destroy 
  resources :listings
  get 'profiles/user'
  get 'profiles/stockist'
  #get 'home/index'
  root to: "home#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
