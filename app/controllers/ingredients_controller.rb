class IngredientsController < ApplicationController
  def index
    @ingredient = Ingredient.find(params[:id])
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @recipe = Recipe.find(params[:id])
    @ingredient = Ingredient.new()
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new(ingredient_params)
    if @ingredient.save
      redirect_to edit_user_recipe_path(@recipe.user, @recipe)
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :amount)
  end
end
