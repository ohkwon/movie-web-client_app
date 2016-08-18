class MoviesController < ApplicationController

  def show

    @movie = Unirest.get("http://localhost:3000/api/v1/movies/#{params[:id]}.json").body

  end

  def index

    @movies = Unirest.get("http://localhost:3000/api/v1/movies.json").body

  end

  def new

  end

  def create

    @movie = Unirest.post("http://localhost:3000/api/v1/movies.json",
      headers: {Accept: "application/json"},
      parameters: {
        name: params[:name],
        length: params[:length],
        year: params[:year],
        description: params[:description]
      }
    )

    redirect_to '/movies'

  end

end
