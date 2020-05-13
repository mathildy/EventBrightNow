Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :users
  root 'events#index'
  resources :charges
  resources :attendances
end
