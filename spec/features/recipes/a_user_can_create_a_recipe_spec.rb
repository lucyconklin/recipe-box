require 'rails_helper'

describe "User can create a recipe" do
  scenario "a user can submit recipe information" do
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

    visit login_path
    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    visit new_user_recipe_path(user)

    recipe = user.recipes.new(title: nil, description: nil)

    fill_in "title", with: recipe.title
    fill_in "description", with: recipe.description
    click_on('Create new recipe')
    expect(page).to have_content('add a new recipe')
  end
end
