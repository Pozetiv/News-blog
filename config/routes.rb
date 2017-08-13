Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

root 'posts#index'
resources :users

resources :pictures, only: [:create, :destroy]
resources :posts 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
match '/singin', to:'sessions#new', via: 'get'
  end
