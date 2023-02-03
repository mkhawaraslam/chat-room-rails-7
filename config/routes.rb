# frozen_string_literal: true

Rails.application.routes.draw do
  root 'conversations#index'

  resources :conversations, only: :index
end
