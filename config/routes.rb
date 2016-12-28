Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, only: [:new, :show, :create, :destroy] do
    resources :recipes, only: [:new, :create, :index, :show] do
      resources :ingredients, only: [:new, :create, :show]
      resources :directions, only: [:new, :create, :show]
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:show, :index]
  end
end
