Rails.application.routes.draw do
  resources :attendances

  root "events#index"
  resources :events
  
  resources :users
  devise_for :users
end
