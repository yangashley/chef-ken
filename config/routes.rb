Rails.application.routes.draw do
  root 'categories#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: "users#new"
  post 'signup', to: "users#create"
  get 'profile', to: "users#show"
  # get 'friends', to: "users#index"

  resources :categories do
    resources :recipes, except: [:index]
  end
end
