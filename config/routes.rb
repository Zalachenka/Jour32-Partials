Rails.application.routes.draw do
  root "events#index"
  resources :attendances
  resources :events
  resources :users
end
