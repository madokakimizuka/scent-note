Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  root to: 'notes#index'
  resources :notes, except: :index

  # resources :fragrances
  # resources :brands
  # resources :perfumers
end
