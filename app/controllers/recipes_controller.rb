class RecipesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @recipe = Recipe.new()
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      flash[:success] = "You created #{@recipe.title}"
      redirect_to user_recipe_path(@user, @recipe)
    else
      render :new
    end
  end

  def index
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end
end
