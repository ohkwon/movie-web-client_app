class MoviesController < ApplicationController

  def show

    @movie = Unirest.get("https://api-builder-movies-app.herokuapp.com/api/v1/movies/#{params[:id]}.json").body

  end

  def index

    @movies = Unirest.get("https://api-builder-movies-app.herokuapp.com/api/v1/movies.json").body

  end

  def new

  end

  def create

    @movie = Unirest.post("https://api-builder-movies-app.herokuapp.com/api/v1/movies.json",
      headers: {Accept: "application/json"},
      parameters: {
        name: params[:name],
        length: params[:length],
        year: params[:year],
        description: params[:description]
      }
    )

    redirect_to "/movies/#{@movie["id"]}"

  end

  def edit

    @movie = Unirest.get("https://api-builder-movies-app.herokuapp.com/api/v1/movies/#{params[:id]}.json").body
    
  end

  def update

    @movie = Unirest.patch("https://api-builder-movies-app.herokuapp.com/api/v1/movies/#{params[:id]}.json",
      headers: {Accept: "application/json"},
      parameters: {
        name: params[:name],
        length: params[:length],
        year: params[:year],
        description: params[:description]
      }
    )

    binding.pry

    redirect_to "/movies/#{params["id"]}"
    
  end

  def destroy

    @movie = Unirest.delete("http://localhost:3000/api/v1/movies/#{params[:id]}.json").body

    redirect_to "/movies"
    
  end

end
