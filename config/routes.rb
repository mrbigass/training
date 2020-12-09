# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_sessions, only: %i[new create delete]
  resources :user_registrations, only: %i[new create]

  root to: 'application#home'

  resources :users,     only: %i[index new create]
  resources :machines,  only: %i[new create]
  resources :offices,   only: %i[new create]
  resources :customers, only: %i[new create]
  resources :lendings,  only: %i[new create]
end
