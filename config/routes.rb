Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
    member do
      get :likes
    end
  end
  
  
  resources :games, only: [:create, :show] do
    member do
      resources :reviews, only: [:new, :create, :show, :edit, :update, :destroy]
    end
  end
  
  resources :favorites, only: [:create, :destroy]
end
