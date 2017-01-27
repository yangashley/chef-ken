Rails.application.routes.draw do

  root 'categories#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: "users#new"
  post 'signup', to: "users#create"
  get 'profile', to: "users#show"

  resources :users, only: :index

  resources :users, only: [:destroy]

  resources :categories do
    resources :recipes, except: [:index, :show]
  end


  resources :recipes, only: [:show] do
    resources :sales, except: [:show, :delete, :edit, :new]
    resources :ratings, only: [:create, :edit]
    resources :measures, only: [:new, :create]
  end


end
