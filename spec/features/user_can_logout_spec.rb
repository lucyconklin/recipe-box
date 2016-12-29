require 'rails_helper'

describe "User visits login page" do
  scenario "a user can login then logout as a user" do
    user = create(:user)

    visit login_path
    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    click_on "logout"

    expect(page).to have_content("Successfully logged out")
    expect(page).to have_button("Login")
  end
end
