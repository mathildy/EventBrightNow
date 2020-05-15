Rails.application.routes.draw do
  devise_for :users 
  resources :events do
    resources :avatars, only: [:create]
  end 
  resources :users 
  root 'events#index'
  resources :charges
  resources :attendances
end
