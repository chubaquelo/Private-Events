Rails.application.routes.draw do
  root to: 'user#index'
  resources :user, only: [:show, :new, :create]
  resources :session, only: [:new, :create, :destroy]
  resources :event, only: [:index, :new, :create, :show]
end
