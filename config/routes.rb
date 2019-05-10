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

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  resources :events do
    resources :event_pictures, only: [:create]
  end

  resources :admin

  resources :event_submissions, only: [:edit, :update]

  resources :user_validations, only: [:edit, :update]

end
