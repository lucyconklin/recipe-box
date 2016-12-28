class IngredientsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
    @ingredient = @recipe.ingredients.build
  end
end
