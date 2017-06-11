Rails.application.routes.draw do
  resources :trains do
    resources :carriages, shallow: true, except: [:index]
    resources :tickets, shallow: true, only: [:new, :show, :create, :delete]
  end
  resources :stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes
  resource :search, only: [:show]
end
