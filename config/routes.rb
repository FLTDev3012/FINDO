Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  resources :wishlists

  resources :wishlists_gifts, only: [:show]
  resources :votes, only: [:create]

  post 'upvotes', to: "votes#upvote"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
