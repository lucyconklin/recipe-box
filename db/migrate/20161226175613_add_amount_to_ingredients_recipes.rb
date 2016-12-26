class AddAmountToIngredientsRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients_recipes, :amount, :string
  end
end
