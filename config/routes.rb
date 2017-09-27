Rails.application.routes.draw do
  resources :addposts
  get 'password_resets/new'

  get 'passwrod_resets/new'

  get 'passwrod_resets/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts

  resources :users
  get '/singup', to: 'users#new'
  post '/singup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :contacts, only: [:new, :show, :create]
end
