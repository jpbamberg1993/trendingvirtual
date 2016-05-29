Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  root to: 'articles#index'

  # Leave until decided on side widget well
  get 'visitors', to: 'visitors#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users
  resources :articles do
    resources :comments
  end
end
