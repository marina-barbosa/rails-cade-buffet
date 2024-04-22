Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :buffet, only: [:index, :new, :create, :show, :edit, :update]
  resources :address, only: [:index, :new, :create, :show, :edit, :update]
  resources :payment_method, only: [:index, :new, :create, :show, :edit, :update]
end
