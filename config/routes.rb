Rails.application.routes.draw do
  resources :bills
  resources :items
  resources :bill, only: [:index, :new, :create, :show]
  get :search, controller: :dashboard
  root to: 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
