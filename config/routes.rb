# frozen_string_literal: true

Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'sessions/new'
  get 'users/new'
  get 'persons/new'
  root 'static_pages#home'
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'

  resources :microposts
  get '/posts' => 'post#index'
  get 'posts/index'
  get '/signup' => 'users#new'
  post '/singup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :microposts, only:[:create, :destroy]
  resources :relationships, only:[:create,:destroy]
  resources :likes, only: [:create, :destroy]
end 
