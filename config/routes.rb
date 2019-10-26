Rails.application.routes.draw do

  devise_for :users
  get 'posts/index'
  get 'posts/show'
  get 'users/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root to: 'tasks#index'
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
  end
  
  root to: 'profiles#index'
  resources :profiles do
    post :confirm, action: :confirm_new, on: :new
  end
end
