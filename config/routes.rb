Rails.application.routes.draw do
root 'posts#index'


resources :posts do
  resource :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  end
