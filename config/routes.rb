Rails.application.routes.draw do
  root 'sessions#new'
  
  resources :users, only: [:new, :show, :create] do
    resources :recipes, only: [:new, :create, :index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:show]
  end
end
