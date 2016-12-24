require 'rails_helper'

describe "User visits login page" do
  scenario "a user can login as a user" do
    user = create(:user)

    visit login_path
    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Successfully logged in")
    expect(page).to have_content("#{user.first_name}")
    expect(page).to have_content("Logout")
  end

  scenario "a user can login as an admin" do
    admin = create(:user, role: "admin")

    visit login_path
    within("form") do
      fill_in "email", with: admin.email
      fill_in "password", with: admin.password
      click_on "Login"
    end

    expect(admin.admin?).to be true
    expect(page).to have_content("admin")
  end
end
