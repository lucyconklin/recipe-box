class DirectionsController < ApplicationController
  def new
    @user = User.find(params[:id])
    byebug
    @recipe = Recipe.find(params[:recipe_id])
    @direction = Direction.new()
  end

  def create
  end

  def show
  end

  def index
  end
end
