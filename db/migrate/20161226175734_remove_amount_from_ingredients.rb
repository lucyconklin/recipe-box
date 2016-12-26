class RemoveAmountFromIngredients < ActiveRecord::Migration[5.0]
  def change
    remove_column :ingredients, :amount
  end
end
