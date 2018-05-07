Rails.application.routes.draw do
  root 'pages#home'

  # User controller using Devise
  devise_for :users
  devise_scope :user do
      GET '/sign_up/user', to: 'devise/registrations#new'
  end

  # Pages controller
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
