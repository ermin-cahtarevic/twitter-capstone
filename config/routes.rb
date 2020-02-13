Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/user/:id', to: 'users#show', as: 'user'
  resources :users, only: %i[edit update destroy]

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/discover', to: 'opinions#discover', as: 'discover'
  resources :opinions, only: [:new, :create, :index]

  post 'followings/:id', to: 'followings#create', as: 'followings'
  resources :followings, only: %i[destroy]
end
