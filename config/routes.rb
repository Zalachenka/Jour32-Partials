Rails.application.routes.draw do
  resources :static_pages, only: [:index, :secret]
  resources :attendances

  root "events#index"
  resources :events

  resources :users
  devise_for :users
end
