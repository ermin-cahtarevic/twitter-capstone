Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get 'user/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :opinions, only: [:new, :create, :index]

  post 'followings/:id', to: 'followings#create', as: 'followings'
  resources :followings, only: %i[destroy]
end
