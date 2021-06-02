Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users

  get 'reservations/index'
  get 'reservations/show'

  # creates all - GET POST PATCH PUT DELETE index create new edit show update destroy 
  resources :listings

  get 'profiles/user'
  get 'profiles/stockist'

  get 'profiles/stockist/new', to: "profiles#new"
  post 'profiles/stockist', to: "profiles#create"

  get 'profiles/stockist/edit', to: "profiles#edit"

  put 'profiles/stockist', to: "profiles#update", as: 'edit_stockist'

  get 'profiles/stockist/brand', to: "profiles#brand"
  get 'profiles/stockist/brand/new', to: "profiles#brand_new"
  post 'profiles/stockist/brand', to: "profiles#brand_create"

  post 'profiles/stockist/brand/add', to: "profiles#stockist_brand_add", as: 'add_brand_to_stockist'

  

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
