Rails.application.routes.draw do
  
  get '/movies/new', to: 'movies#new'
  post '/movies', to: 'movies#create'
  get '/movies/:id', to: 'movies#show'
  get '/movies', to: 'movies#index'
  get '/movies/index', to: 'movies#index'

end
