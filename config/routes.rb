Rails.application.routes.draw do

  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  get 'users/show'

  devise_for :admins

  get 'profile/index'

  get 'profile/show'

  root 'tennis_courts#index'

  get 'sessions/new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]
  resources :leads
  
  resources :tennis_courts do
  resources :profile
  resources :bookings
    # member do
    #   get "Like", to: 'bookings#upvote'
    #   get "Dislike", to: 'bookings#downvote'
    # end
	end
end
