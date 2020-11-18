Rails.application.routes.draw do
  resources :user, only: [:show, :new, :create]
  resources :session, only: [:new, :create, :destroy]
end
