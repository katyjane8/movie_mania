class DirectorsController < ApplicationController
  before_action :set_director, only: [:show, :edit, :destroy, :update]

  def index
    @director = Director.all
  end

  def new
    @director = Director.new
  end

  def create
    director = Director.new(director_params)
    if director.save
      redirect_to "/directors/#{director.id}"
    else
      render :new
    end
  end

  def show
    @director = Director.find(params[:id])
  end

  private

    def director_params
      params.require(:director).permit(:name)
    end

    def set_director
      @director = Director.find(params[:id])
    end
end
