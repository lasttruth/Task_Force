Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'games#index', as: 'home'

  get 'about' => 'gamesowned#about', as: 'about'
  resources :games do
    get 'progress' => 'trackers#progress', as: 'progress'
  end
end
