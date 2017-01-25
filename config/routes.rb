Rails.application.routes.draw do
  root 'recipes#new'

  get 'recipes/new', to: 'recipes#new'

  post 'recipes/new', to: 'recipes#create'
  # resources :recipes, only: [:create]

  get 'recipes/show'

  put 'recipes/edit'

  delete 'recipes/destroy'

  get 'recipes/update'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: "users#new"
  post 'signup', to: "users#create"
  get 'profile', to: "users#show"
  # get 'friends', to: "users#index"

  resources :categories
  root 'categories#index'
end
