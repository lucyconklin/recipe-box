require 'rails_helper'

describe "User creates recipe" do
  before :each do
    @user = create(:user)
    visit login_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_on "Login"

    visit new_user_recipe_path(@user)
    fill_in "title", with: "Puppy Chow"
    fill_in "description", with: "snack food"
    click_on('Create new recipe')

    @recipe = Recipe.first
  end
  scenario "after a user creates a recipe they can add ingredient" do
    fill_in "name", with: "chocolate chips"
    fill_in "amount", with: "12 oz"
    click_on "add ingredient"

    click_on 'done editing'

    expect(page).to have_content("Puppy Chow")
    expect(page).not_to have_content("done editing")
  end

  scenario "after a user creates a recipe they can see all ingredients" do
    skip
  end

  scenario "a user cannot submit a blank or incomplete ingredient" do
    skip
  end
end
