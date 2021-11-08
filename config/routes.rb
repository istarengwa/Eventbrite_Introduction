Rails.application.routes.draw do
  resources :attendances
  resources :events
  resources :users
  root 'events#index'
end
