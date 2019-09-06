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
    resources :favorites, only: [:create, :destroy]
    collection do # member do ?　コントローラでidを指定すればいい？
      get :my_index
    end
  end

  resources :fragrances, only: [:index, :show]
  resources :brands, only: [:index, :show]
  resources :perfumers, only: [:index, :show]
end
