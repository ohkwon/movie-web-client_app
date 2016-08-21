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

    @movie = Unirest.post("#{ENV['DOMAIN']}/movies.json",
      headers: {Accept: "application/json"},
      parameters: {
        name: params[:name],
        length: params[:length],
        year: params[:year],
        description: params[:description]
      }
    )

    redirect_to "/movies"

  end

  def edit

    @movie = Unirest.get("#{ENV['DOMAIN']}/movies/#{params[:id]}.json").body
    
  end

  def update

    # @movie = Unirest.patch("#{ENV['DOMAIN']}/movies/#{params[:id]}.json",
    #   headers: {Accept: "application/json"},
    #   parameters: {
    #     name: params[:name],
    #     length: params[:length],
    #     year: params[:year],
    #     description: params[:description]
    #   }
    # )

    @movie = Movie.find(params[:id]).update(params[:id], params[:name], params[:length], params[:year], params[:description])

    redirect_to "/movies/#{params[:id]}"
    
  end

  def destroy

    # @movie = Unirest.delete("http://localhost:3000/api/v1/movies/#{params[:id]}.json").body

    Movie.destroy(params[:id])

    redirect_to "/movies"
    
  end

end
