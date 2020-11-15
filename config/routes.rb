# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'application#home'

  resources :users,     only: %i[index new create]
  resources :machines,  only: %i[new create]
  resources :offices,   only: %i[new create]
  resources :customers, only: %i[new create]
  resources :lendings,  only: %i[new create]
end
