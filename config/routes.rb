Rails.application.routes.draw do

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: "users#new"
  post 'signup', to: "users#create"
  get 'profile', to: "users#show"

  resources :categories
  root 'categories#index'
end
