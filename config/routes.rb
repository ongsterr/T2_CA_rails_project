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

end
