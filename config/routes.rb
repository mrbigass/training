# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'application#home'
  get 'login', to: 'application#login'
  post 'login_confirmation', to: 'application#login_confirmation'

  resources :users,     only: %i[index new create]
  resources :machines,  only: %i[new create]
  resources :offices,   only: %i[new create]
  resources :customers, only: %i[new create]
  resources :lendings,  only: %i[new create]
end
