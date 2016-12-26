class RecipesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new()
  end

  def create
    user = User.find(params[:user_id])
    recipe = user.recipes.create(recipe_params)
    redirect_to user_path(user)
  end

  def index

  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :method)
  end
end
