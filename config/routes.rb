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
end
