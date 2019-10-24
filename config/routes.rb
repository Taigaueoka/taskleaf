Rails.application.routes.draw do

  get 'posts/index'
  get 'posts/show'
  get 'users/index'
  get 'users/show'
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
end
