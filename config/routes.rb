Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :fragrances, except: [:show]
    resources :brands
    resources :perfumers
  end
  devise_for :users
  resources :users, only: [:index, :show]
  root to: 'notes#index'
  resources :notes, except: :index

  resources :fragrances
  # , only: [:index, :show]
  # resources :brands
  # resources :perfumers
end
