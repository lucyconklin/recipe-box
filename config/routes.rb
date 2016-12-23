Rails.application.routes.draw do
  resources :user, only: [:new]
  get '/login', to: 'sessions#new'
end
