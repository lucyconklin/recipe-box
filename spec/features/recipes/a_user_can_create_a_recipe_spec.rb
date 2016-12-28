require 'rails_helper'

describe "User can create a recipe" do
  scenario "a user can submit recipe information" do
    skip
    user = create(:user)

    visit new_user_recipe_path(user)

    fill_in "title", with: "Puppy Chow"
    fill_in "description", with: "best food on earth"
    click_on('Create new recipe')

    # fill_in "description", with: "delicious"
    # click_on('add direction')
    #
    # fill_in "name", with: "chocolate"
    # fill_in "amount", with: 100
    # click_on('Add Ingredient')

    recipe = Recipe.find_by(title: "Puppy Chow")

    expect(current_path).to eq(user_recipe_path(user, recipe))
    expect(page).to have_content("Puppy Chow")
  end

  scenario "incomplete information" do
    user = create(:user)

    visit new_user_recipe_path(user)

    fill_in "title", with: "Puppy Chow"
    click_on('Create new recipe')

    expect(current_path).to eq(new_user_recipe_path(user))
  end
end
