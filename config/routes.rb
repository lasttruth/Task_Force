Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sign_in', to:  "sessions#new"
  post '/sign_in', to: "sessions#create"
  delete '/sessions', to: 'sessions#destroy'

  root 'user#index', as: 'home'

  resources :users, :only => [:new, :create]
  resources :games do
    resources :statuses
  end
end
#Prefix Verb   URI Pattern                                 Controller#Action
#         sign_in GET    /sign_in(.:format)                          sessions#new
#                 POST   /sign_in(.:format)                          sessions#create
#        sessions DELETE /sessions(.:format)                         sessions#destroy
#            home GET    /                                           games#index
#           users POST   /users(.:format)                            users#create
#        new_user GET    /users/new(.:format)                        users#new
#   game_statuses GET    /games/:game_id/statuses(.:format)          statuses#index
#                 POST   /games/:game_id/statuses(.:format)          statuses#create
# new_game_status GET    /games/:game_id/statuses/new(.:format)      statuses#new
#edit_game_status GET    /games/:game_id/statuses/:id/edit(.:format) statuses#edit
#     game_status GET    /games/:game_id/statuses/:id(.:format)      statuses#show
#                 PATCH  /games/:game_id/statuses/:id(.:format)      statuses#update
#                 PUT    /games/:game_id/statuses/:id(.:format)      statuses#update
#                 DELETE /games/:game_id/statuses/:id(.:format)      statuses#destroy
#           games GET    /games(.:format)                            games#index
#                 POST   /games(.:format)                            games#create
#        new_game GET    /games/new(.:format)                        games#new
#       edit_game GET    /games/:id/edit(.:format)                   games#edit
#            game GET    /games/:id(.:format)                        games#show
#                 PATCH  /games/:id(.:format)                        games#update
#                 PUT    /games/:id(.:format)                        games#update
#                 DELETE /games/:id(.:format)                        games#destroy
#                 GET    /progress-job/:job_id(.:format)             progress_job/progress#show
