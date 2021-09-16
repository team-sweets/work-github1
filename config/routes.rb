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

end