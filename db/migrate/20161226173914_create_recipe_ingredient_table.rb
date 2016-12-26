class CreateRecipeIngredientTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :recipes, :ingredients do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
    end
  end
end
