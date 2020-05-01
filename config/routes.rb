Rails.application.routes.draw do
  resources :scratchpads
  resources :upvotes
  resources :tags
  resources :replies
  resources :posts
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/users/:id/upload_image', to: 'users#uploadImage'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
