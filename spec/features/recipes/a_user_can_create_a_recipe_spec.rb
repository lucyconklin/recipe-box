require 'rails_helper'

describe "User can create a recipe" do
  scenario "a user can submit recipe information" do
    user = create(:user)

    visit new_user_recipe_path(user)

    fill_in "title", with: "Puppy Chow"
    fill_in "description", with: "best food on earth"
    fill_in "method", with: "mix all ingredients together"
    click_on('Create new recipe')

    recipe = Recipe.find_by(title: "Puppy Chow")

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Puppy Chow")
  end
end
