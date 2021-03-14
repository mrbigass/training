# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'application#home'
  get 'login', to: 'application#login'
  post 'login_authenticate', to: 'application#login_authenticate'
  get 'registration', to: 'application#registration'
  post 'registration_post', to: 'application#registration_post'

  resources :users,     only: %i[index new create]
  resources :machines,  only: %i[new create]
  resources :offices,   only: %i[new create]
  resources :customers, only: %i[new create]
  resources :lendings,  only: %i[new create]
end
