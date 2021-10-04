Rails.application.routes.draw do
  resources :labels
  get '/login'=> 'sessions#new'
  post '/login'=> 'sessions#create'
  delete '/logout'=> 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  root to: 'tasks#index'
  resources :tasks
  resources :users
end
