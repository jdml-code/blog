# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'articles#index'
  resources :articles do
    resources :comments
  end
  get "articles/user/:user_id", to: "articles#from_author"
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
