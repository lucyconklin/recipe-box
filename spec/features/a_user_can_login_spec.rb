require 'rails_helper'

describe "User visits login page" do
  scenario "a user can login as a user" do
    user = create(:user)
    # user = User.create(first_name: "Lucy", last_name: "C", password: "boom")

    visit login_path
    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Welcome, #{user.name}!")
    expect(page).to have_content("Logout")
  end

  scenario "a user can login as an admin" do
    skip
  end
end
