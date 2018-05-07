Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  
  # User controller using Devise
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/sign_up/user', to: 'devise/registrations#new'
    delete '/sign_out', to: 'devise/sessions#destroy'
  end
  
  # Pages controller
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  
  # Profiles controller
  get 'sign_up/profile', to: 'profiles#new'
  post 'profile', to: 'profiles#create'
  get 'profile/show', to: 'profiles#show'
  get 'profiles', to: 'profiles#index'
  get 'profile/edit', to: 'profiles#edit'
  patch 'profile/edit', to: 'profiles#update' 
  delete 'profile', to: 'profiles#destroy'

  # Products controller
  get 'sign_up/product', to: 'products#new'
  post 'product', to: 'products#create'
  get 'product/:id', to: 'products#show'
  get 'products', to: 'products#index'
  get 'product/:id/edit', to: 'products#edit'
  patch 'product/:id', to: 'products#update'
  delete 'product/:id', to: 'products#destroy'

  # Bookings controller  
  get 'booking/new', to: 'bookings#new'
  post 'booking', to: 'bookings#create'
  get 'booking/:id', to: 'bookings#show'
  get 'bookings', to: 'bookings#index'
  get 'booking/:id/edit', to: 'bookings#edit'
  patch 'booking/:id', to: 'bookings#update'
  delete 'booking/:id', to: 'bookings#destroy'
end
