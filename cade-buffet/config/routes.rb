Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :buffet, only: [:index, :new, :create, :show, :edit, :update]
  resources :address, only: [:index, :new, :create, :show, :edit, :update]
  resources :payment_method, only: [:index, :new, :create, :show, :edit, :update]
  resources :event, only: [:index, :new, :create, :show, :edit, :update]
  resources :price, only: [:index, :new, :create, :show, :edit, :update]

  get "search", to: "home#search"

  resources :order, only: [:index, :new, :create, :show, :edit, :update] do
    patch :conclude, on: :member
  end
end
