Rails.application.routes.draw do
  get 'event_pictures/create'
  get 'avatars/show'
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

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :events do
    resources :event_pictures, only: [:create]
  end

  namespace :admin do
    root "admin#index"
  end
end
