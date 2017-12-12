class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @director = Director.find(params[:director_id])
    @movie = Movie.new
  end

  def create
    # movie = Movie.new(movie_params)
    director = Director.find(params[:director_id])
    movie = director.movies.new(movie_params)
    if movie.save
      redirect_to "/movies/#{movie.id}"
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :description)
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end
end
