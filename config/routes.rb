Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users

  #Profile Routes

  get 'profiles/user'

  #Profile: Stockist Routes

  get 'profiles/stockist'
  get 'profiles/stockist/new', to: "profiles#new"
  post 'profiles/stockist', to: "profiles#create"
  get 'profiles/stockist/edit', to: "profiles#edit"
  put 'profiles/stockist', to: "profiles#update", as: 'edit_stockist'

  #Profile: Stockist: Brand Routes

  get 'profiles/stockist/brand', to: "profiles#brand"

  ## Create new brand
  get 'profiles/stockist/brand/new', to: "profiles#brand_new"
  post 'profiles/stockist/brand', to: "profiles#brand_create"

  ## Create new stockist_brand association
  post 'profiles/stockist/brand/add', to: "profiles#stockist_brand_add", as: 'add_brand_to_stockist'


  #Listings:
  #GET POST PATCH PUT DELETE index create new edit show update destroy 
  resources :listings

  post 'listings/new', to: "listings#create", as: 'create_new_listing'

  put 'listings/:id', to: "listings#update", as: 'update_listing'

  ##Listings: Sizes: Routes
  get 'listings/:id/edit/sizes/new', to: 'listings#sizes_new', as: 'add_size'
  post 'listings/:id/edit/sizes/new', to: "listings#sizes_create", as: 'create_size'

  #Reservations
  get 'reservations/index', to: "reservations#index", as: 'reservations'

  get 'reservations/:id', to: "reservations#show", as: 'show_reservation'

  post 'reservations/:id', to: "reservations#create", as: 'create_reservation'

  

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
