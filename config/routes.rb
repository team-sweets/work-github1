Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :admin do
    devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      passwords: 'admins/passwords',
      registrations: 'admins/registrations'
    }
  end

end