Rails.application.routes.draw do
  resources :trains do
    resources :carriages, shallow: true, except: [:index]
  end
  resources :stations do
    patch :update_position, on: :member
  end
  resources :routes
end
