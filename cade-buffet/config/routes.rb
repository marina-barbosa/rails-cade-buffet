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

  namespace :api do
    namespace :v1 do
      resources :buffet, only: [:index, :show] do
        resources :event, only: [:index, :check_availability], param: :buffet_id
      end
      post 'check_availability', to: 'event#check_availability'
    end
  end
end
