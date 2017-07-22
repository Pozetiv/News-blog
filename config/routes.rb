Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/new'

  get 'posts/show'

  get 'posts/update'

  get 'posts/destroy'
resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
