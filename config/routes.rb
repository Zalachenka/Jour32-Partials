Rails.application.routes.draw do
  resources :attendances

  root "home#index"
  resources :events

  devise_for :users
  resources :users, only: [:show]
end
