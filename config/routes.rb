Rails.application.routes.draw do
  devise_for :users

  root to: "searches#show"

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end

    resources :tickets

    resources :routes

    resources :stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end

    resources :users
  end

  resources :trains do
    resources :tickets, shallow: true, only: [:new, :show, :create, :delete]
  end

  resource :search, only: [:show]
end
