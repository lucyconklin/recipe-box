require 'rails_helper'

describe "User can create an account" do
  scenario "a user can put in information" do
    visit new_user_path

    fill_in "user[first_name]", with: "Hermione"
    fill_in "user[last_name]", with: "Granger"
    fill_in "user[email]", with: "hg@hg.com"
    fill_in "user[password]", with: "ILoveBooks"
    click_on "Create New User"

    User.find_by(first_name: "Hermione").save

    expect(current_path).to eq(user_path(User.find_by(first_name: "Hermione")))
    expect(page).to have_content("Hermione Granger")
    expect(page).to have_content("Successfully created account for Hermione")
  end
end
