Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/', to: 'sessions#destroy'

  root 'games#index', as: 'home'

  resources :users, :only => [:new, :create]
  resources :games do
    resources :statuses
  end
end
