Rails.application.routes.draw do
  get 'persons/new'
  root 'static_pages#home'
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'

  resources :microposts
  resources :users
  get '/posts' => "post#index"
  get 'posts/index'
  get '/signup' => 'persons#new'
end
