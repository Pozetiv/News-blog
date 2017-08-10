Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

root 'posts#index'

resources :pictures, only: [:create, :destroy]
resources :posts do
  resource :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  end
