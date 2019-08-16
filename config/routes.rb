Rails.application.routes.draw do
  get 'perfumers/index'
  get 'brands/index'
  devise_for :users
  resources :users, only: [:index, :show]
  root to: 'notes#index'
  resources :notes, except: :index

  # resources :fragrances
  # resources :brands
  # resources :perfumers
end
