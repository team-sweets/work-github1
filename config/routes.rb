Rails.application.routes.draw do

  devise_for :customer, controllers: {
    sessions: 'customer/sessions',
    passwords: 'customer/passwords',
    registrations: 'customer/registrations'
  }

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  get	'customers' => 'customer/customers#show'
  get	'customers/quit' =>	'customer/customers#quit'
  patch 'customers/out' => 'customer/customers#out'
  get	'customers/edit' =>	'customer/customers#edit'
  put 'customers' => 'customer/customers#update'

  root to: 'customer/homes#top'
  get	'about' => 'customer/homes#about'
  get 'products' =>	'customer/products#index'
  get	'products/:id' => 'customer/products#show'

  get	'cart_items' => 'customer/cart_items#index'
  patch	'cart_items/:id' => 'customer/cart_items#update', as: 'cart_items_update'
  post 'cart_items' => 'customer/cart_items#create', as: 'cart_items_create'
  delete 'cart_items/:id' => 'customer/cart_items#destroy', as: 'cart_items_destroy'
  delete 'cart_items' => 'customer/cart_items#destroy_all', as: 'cart_items_destroy_all'

  get 'orders/new' => 'customer/orders#new'
  post 'orders/log' => 'customer/orders#log'
  post 'orders' => 'customer/orders#create'
  get 'thanx' => 'customer/orders#thanx'
  get 'orders' =>	'customer/orders#index', as: 'orders_all'
  get 'orders/:id' =>	'customer/orders#show'

  get	'shipping_addresses' => 'customer/shipping_addresses#index'
  post 'shipping_addresses' =>	'customer/shipping_addresses#create'
  delete 'shipping_addresses/:id' =>	'customer/shipping_addresses#destroy', as: 'delete_address'
  get	'shipping_addresses/:id/edit' =>	'customer/shipping_addresses#edit', as: 'edit_address'
  patch	'shipping_addresses/:id' => 'customer/shipping_addresses#update', as: 'update_address'

  namespace :admin do

  get 'customers' => 'customers#index'
  get 'customers/:id' => 'customers#show', as: 'customer'
  get 'customers/:id/edit' => 'customers#edit', as: 'customer_edit'
  patch 'customers/:id' => 'customers#update', as: 'customer_update'

  get 'products' => 'products#index'
  get	'products/new' => 'products#new'
  post	'products'  => 'products#create'
  get	'products/:id' => 'products#show', as: 'product'
  patch	'products/:id' => 'products#update'
  get	'products/:id/edit' => 'products#edit', as: 'product_edit'

  get	'genres' => 'genres#index'
  post 'genres' => 'genres#create'
  get	'genres/:id/edit' => 'genres#edit', as: 'genres_edit'
  patch	'genres/:id/edit' => 'genres#update'

  get	'top' => 'orders#top'
  get	'orders/:id' => 'orders#show'
  patch	'orders/:id' => 'orders#update'

  patch	'order_details/:id' => 'order_details#update'

 end

end