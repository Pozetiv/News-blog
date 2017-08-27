Rails.application.routes.draw do
resources :sessions, only: [:new, :create, :destroy]

root 'posts#index'
resources :users

resources :pictures, only: [:create, :destroy]
resources :posts 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/singin', to: 'sessions#new' 
#post '/singin', to: 'sessions#create'
#delete  '/logout' to: 'sessions#destroy'
resources :account_activations, only: [:edit]
get '/creatpost', to: 'posts#new'

end
