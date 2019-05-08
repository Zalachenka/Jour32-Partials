Rails.application.routes.draw do
  resources :events do
    resources :attendances
  end

  root "home#index"
  resources :events

  devise_for :users
  resources :users, only: [:show, :edit]

  resources :events do
    resources :charges
  end

  resources :users do
    resources :events
  end
end
