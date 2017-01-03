class DirectionsController < ApplicationController
  def index
    @direction = Direction.find(params[:id])
  end

  def new
    @user = User.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @direction = Direction.new()
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @direction = @recipe.directions.new(direction_params)
    if @direction.save
      redirect_to edit_user_recipe_path(@recipe.user, @recipe)
    else
      redirect_to edit_user_recipe_path(@recipe.user, @recipe)
    end
  end

  def show
    @direction = Direction.find(params[:id])
  end

  private

  def direction_params
    params.require(:direction).permit(:description)
  end
end
