require 'rails_helper'

describe "User can create a recipe" do
  scenario "a user can submit recipe information" do
    user = create(:user)

    visit new_user_recipe_path(user)

    fill_in "title", with: "Puppy Chow"
    fill_in "description", with: "best food on earth"
    click_on "add ingredient"
    fill_in "name", with: "Chex"
    fill_in "amount", with: "100"
    click_on "add ingredient"
    fill_in "name", with: "chocolate"
    fill_in "amount", with: "300"
    click_on('Create new recipe')

    recipe = Recipe.find_by(title: "Puppy Chow")

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Puppy Chow")
  end
end
