Rails.application.routes.draw do
  resources :trains
  resources :stations do
    patch :update_position, on: :member
  end
  resources :routes
  resources :carriages
end
