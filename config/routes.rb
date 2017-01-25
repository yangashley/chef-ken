Rails.application.routes.draw do
  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  get 'signup', to: "users#new"

  post 'signup', to: "users#create"

  get 'profile', to: "users#show"

  root 'categories#index'
end
