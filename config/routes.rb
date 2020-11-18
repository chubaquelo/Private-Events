Rails.application.routes.draw do
  root to: 'user#index'
  resources :user, only: [:show, :new, :create]
  resources :session, only: [:new, :create, :destroy]
end
