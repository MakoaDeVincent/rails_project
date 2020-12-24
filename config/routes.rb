Rails.application.routes.draw do

  root 'sessions#home'
  
  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :films
  resources :ratings
  resources :ratings do
    resources :films, only: [:new, :create, :index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
