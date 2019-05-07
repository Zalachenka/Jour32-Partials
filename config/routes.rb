Rails.application.routes.draw do
  resources :attendances

  root "events#index"
  resources :events

  devise_for :users
  resources :users, only: [:show]
end
