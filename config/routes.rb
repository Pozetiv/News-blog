Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts, only: [:index]
 resources :tags, only: [:show]

  namespace :admin do
    resource :posts, expect: [:index]
  end

end
