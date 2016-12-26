class IngredientsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @ingredient = @recipe.ingredients.build
  end
end
