class MoviesController < ApplicationController

  def show

    @movie = Movie.find(params[:id])

  end

  def index

    @movies = Movie.all

  end

  def new

  end

  def create

    movie_hash = {
      name: params[:name],
      length: params[:length],
      year: params[:year],
      description: params[:description]
    }

    @movie = Movie.create(movie_hash)

    redirect_to "/movies"

  end

  def edit

    @movie = Unirest.get("#{ENV['DOMAIN']}/movies/#{params[:id]}.json").body
    
  end

  def update

    movie_hash = {
      id: params[:id],
      name: params[:name],
      length: params[:length],
      year: params[:year],
      description: params[:description]
    }

    @movie = Movie.find(params[:id]).update(movie_hash)

    redirect_to "/movies/#{params[:id]}"
    
  end

  def destroy

    Movie.destroy(params[:id])

    redirect_to "/movies"
    
  end

end
