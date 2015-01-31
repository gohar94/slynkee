Rails.application.routes.draw do
  resources :users
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  get '/entries' => 'entries#show_entries_by_user'
  get '/entries/new' => 'entries#new'
  post '/entries/create' => 'entries#create'
  get '/entries/show/(:id)' => 'entries#show'
end
