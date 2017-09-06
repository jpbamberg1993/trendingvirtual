Rails.application.routes.draw do
  mount Redactor2Rails::Engine => '/redactor2_rails'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/category/show/:id' => 'category#show', as: 'category_show'

  # Leave until decided on side widget well
  get 'visitors', to: 'visitors#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users

  resources :articles do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  mount ActionCable.server => '/cable'

  post 'upvote', to: 'comments#upvote'
  post 'unupvote', to: 'comments#unupvote'
  post 'downvote', to: 'comments#downvote'
  post 'undownvote', to: 'comments#undownvote'

  root 'articles#index'
end
