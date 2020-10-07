# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'application#home'

  resources :posts, only: %i[index new create show]
end
