Rails.application.routes.draw do
  resources :upvotes
  resources :tags
  resources :replies
  resources :posts
  resources :users
  post '/login', to: 'auth#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
