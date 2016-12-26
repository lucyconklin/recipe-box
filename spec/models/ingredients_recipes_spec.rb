require 'rails_helper'

RSpec.describe IngredientRecipe, type: :model do
  context "relationships" do
    it { should belong_to(:recipe) }
    it { should belong_to(:ingredient) }
  end
end
