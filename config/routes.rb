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
  patch 'profile', to: 'profiles#update' 
  delete 'profile', to: 'profiles#destroy'

  # Products controller
  get 'sign_up/product', to: 'products#new'
  post 'product', to: 'products#create', as: :product_new
  get 'product/:id', to: 'products#show', as: :product_show
  get 'products', to: 'products#index'
  get 'product/:id/edit', to: 'products#edit'
  patch 'product/:id', to: 'products#update', as: :product_update
  delete 'product/:id', to: 'products#destroy'

  # Bookings controller  
  get 'booking/new', to: 'bookings#new'
  post 'booking/:id', to: 'bookings#create', as: :booking_create
  get 'booking/:id', to: 'bookings#show', as: :booking_show
  get 'bookings', to: 'bookings#index'
  get 'booking/:id/edit', to: 'bookings#edit'
  patch 'booking/:id', to: 'bookings#update', as: :booking_update
  delete 'booking/:id', to: 'bookings#destroy'
end
