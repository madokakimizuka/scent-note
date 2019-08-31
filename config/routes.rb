Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :fragrances, except: [:show]
    resources :brands, except: [:show]
    resources :perfumers
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    #他にもカスタマイズするコントローラーがあればここに記述する
  }
  resources :users, only: [:index, :show]
  root to: 'notes#index'
  resources :notes do
    resources :comments
  end

  resources :fragrances, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :perfumers, only: [:index, :show]
  resources :favorites, only: [:create, :destroy]
end
