Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root to: 'groups#index'

  resources :budget, only: %i[index]
  resources :users, only: %i[index]
  resources :groups, only: %i[index show new create]
  resources :operations, only: %i[new create]
end
