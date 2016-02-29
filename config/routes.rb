Rails.application.routes.draw do
  # root to: 'visitors#index'
  root to: 'articles#index'
  get 'visitors', to: 'visitors#index'
  
  devise_for :users

  resources :users
  resources :articles do
    resources :comments
  end
end
