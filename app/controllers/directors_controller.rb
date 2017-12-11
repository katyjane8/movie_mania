class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def new
    @directors = Director.new
  end
end
