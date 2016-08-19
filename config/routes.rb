Rails.application.routes.draw do
  
  get '/movies/new', to: 'movies#new'
  post '/movies', to: 'movies#create'
  get '/movies', to: 'movies#index'
  get '/movies/index', to: 'movies#index'
  get '/movies/:id/edit', to: 'movies#edit'
  patch '/movies/:id', to: 'movies#update'
  delete '/movies/:id', to: 'movies#destroy'
  get '/movies/:id', to: 'movies#show'

end
