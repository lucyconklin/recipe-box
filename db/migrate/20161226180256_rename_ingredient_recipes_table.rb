class RenameIngredientRecipesTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :ingredients_recipes, :ingredient_recipes
  end
end
