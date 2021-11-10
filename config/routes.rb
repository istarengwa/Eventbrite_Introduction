Rails.application.routes.draw do
  devise_for :user
  resources :attendance
  resources :event do
    resources :orders, only: [:new, :create]
  end
  resources :user
  resources :teams, only: [:index]
  resources :contacts, only: [:index]
  root 'event#index'
end
