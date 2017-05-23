Rails.application.routes.draw do
  get 'supplier/index'

  get 'products/new_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/products",             to: 'products#index'
  get "/products/new",     to: 'products#new'
  get "/products/:id",        to: 'products#show'
  # post "/new", to: 'products#'
  post "/products",            to: 'products#create'
  get "/products/:id/edit",  to: 'products#edit'
  patch "/products/:id",     to: 'products#update'
  delete "/products/:id",    to: 'products#destroy'
  post '/search',                to: 'products#index'

  get "/images/new",        to: 'images#new'
  post "/images/new",      to: 'images#create'

  get "/products/:product_id/images/new", to: 'images#new'
  post "/products/:product_id/images", to: 'images#create'
  delete "/products/:product_id/image",    to: 'images#destroy'
  get "/signup", to: 'users#new'
  post "/users", to: 'users#create'
  #login/logout
  get "/login", to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get "/logout", to: 'sessions#destroy'
end
