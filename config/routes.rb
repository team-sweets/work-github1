Rails.application.routes.draw do

  namespace :customer do
    get 'shipping_addresses/index'
    get 'shipping_addresses/create'
    get 'shipping_addresses/destroy'
    get 'shipping_addresses/edit'
    get 'shipping_addresses/update'
  end
  namespace :customer do
    get 'orders/new'
    get 'orders/log'
    get 'orders/create'
    get 'orders/thanx'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'orders/top'
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'order_details/update'
  end
  namespace :customer do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/create'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :customer do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :customer do
    get 'products/top'
    get 'products/about'
    get 'products/index'
    get 'products/show'
  end
  namespace :admin do
    get 'products/index'
    get 'products/new'
    get 'products/create'
    get 'products/show'
    get 'products/edit'
    get 'products/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :customer do
    get 'customers/show'
    get 'customers/quit'
    get 'customers/out'
    get 'customers/edit'
    get 'customers/update'
  end
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
  put	'cart_items/:id' => 'customer/cart_items#update'
  post 'cart_items' => 'customer/cart_items#create'
  delete 'cart_items/:id' => 'customer/cart_items#destroy'
  delete 'cart_items' => 'customer/cart_items#destroy_all'

  get 'orders/new' => 'customer/orders#new'
  post 'orders/log' => 'customer/orders#log'
  post 'orders' => 'customer/orders#create'
  get 'thanx' => 'customer/orders#thanx'
  get 'orders' =>	'customer/orders#index'
  get 'orders/:id' =>	'customer/orders#show'

  get	'shipping_adresses' => 'customer/shippping_adress#index'
  post 'shipping_adresses' =>	'customer/shippping_adress#create'
  delete 'shipping_adresses/:id' =>	'customer/shippping_adress#destroy'
  get	'shipping_adresses/:id/edit' =>	'customer/shippping_adress#edit'
  put	'shipping_adresses/:id' => 'customer/shippping_adress#update'

  namespace :admin do

    get 'customers' => 'customers#index'
    get 'customers/:id' => 'customers#show'
    get 'customers/:id/edit' => 'customers#edit'
    put 'customers/:id' => 'customers#update'

    get 'products' => 'products#index'
    get	'products/new' => 'products#new'
    post	'products'  => 'products#create'
    get	'products/:id' => 'products#show'
    get	'products/:id/edit' => 'products#edit'
    put	'products/:id' => 'products#update'

    get	'genres' => 'genres#index'
    post 'genres' => 'genres#create'
    get	'genres/:id/edit' => 'genres#edit'
    put	'genres/:id' => 'genres#update'

    get	'top' => 'orders#top'
    get	'orders/:id' => 'orders#show'
    put	'orders/:id' => 'orders#update'

    put	'order_details/:id' => 'order_details#update'

 end

end