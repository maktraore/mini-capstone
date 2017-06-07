Rails.application.routes.draw do
  get 'supplier/index'

  get 'products/new_page'
  get "/products",             to: 'products#index'
  get "/products/new",     to: 'products#new'
  get "/products/:id",        to: 'products#show'
  post "/products",            to: 'products#create'
  get "/products/:id/edit",  to: 'products#edit'
  patch "/products/:id",     to: 'products#update'
  delete "/products/:id",    to: 'products#destroy'
  post '/search',                to: 'products#index'

  get "/images/new",        to: 'images#new'
  post "/images/new",      to: 'images#create'

  get "/products/:product_id/images/new", to: 'images#new'
  get "/products/:product_id/images/edit", to: 'images#edit'
  patch "/products/:product_id/images/:image_id", to: 'images#update'
  post "/products/:product_id/images", to: 'images#create'
  delete "/products/:product_id/image",    to: 'images#destroy'
  get "/signup", to: 'users#new'
  post "/users", to: 'users#create'
  #login/logout
  get "/login", to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get "/logout", to: 'sessions#destroy'

  post "/orders", to: 'orders#create'
  get '/orders/:id', to: 'orders#show'
  get "/users/edit", to: 'users#edit'
  patch "/users", to: 'users#update'
  get "/orders", to: 'orders#create'

  get '/carts', to: 'carted_products#index'
  post "/carts", to: 'carted_products#create'


  delete "/carts/:id", to: 'carted_products#destroy'
end
