Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'games#index', as: 'home'

  get 'about' => 'gamesowned#about', as: 'about'
  resources :games do
    resources :statuses
  end

  get '/users/new', to: 'users#new', as: 'new_user'
  root 'static_pages#home'
  get '/users', to:'users#index', as: 'users'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/attractions', to: 'attractions#index', as: 'attractions'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/', to: 'sessions#destroy'
end
