Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :rides, :attractions
  root 'static#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/sessions/destroy', to: 'sessions#destroy'
end
