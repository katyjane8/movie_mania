Rails.application.routes.draw do
  # get '/movies', to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :carts, only: [:create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :directors, shallow: true do
    resources :movies
  end

  resources :movies do
    resources :actors
  end

  resources :users, only: [:show, :new, :create]

  namespace :admin do
    resources :categories, only: [:index]
  end
end
