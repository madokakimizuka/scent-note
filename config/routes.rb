Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :fragrances
    resources :brands
    resources :perfumers
  end
  get 'perfumers/index'
  get 'brands/index'
  devise_for :users
  resources :users, only: [:index, :show]
  root to: 'notes#index'
  resources :notes, except: :index

  resources :fragrances, only: [:index, :show]
  # resources :brands
  # resources :perfumers
end
