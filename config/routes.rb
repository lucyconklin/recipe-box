Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:show]
  end
end
