require 'rails_helper'

describe "Admin can delete a user" do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user, first_name: "Arnold", last_name: "Schwartzenegger", email: "as@as.com") }
  let!(:admin) { create(:user, role: 1, email: "admin@admin.com") }

  scenario "an admin can delete a user" do
    visit login_path

    fill_in "email", with: admin.email
    fill_in "password", with: admin.password
    click_button("Login")

    visit admin_users_path(admin)

    within(".user-#{user2.id}") do
      click_on 'Delete'
    end

    expect(page).to have_content(user.first_name)
    expect(page).not_to have_content(user2.first_name)
  end

  scenario "admin cannot delete self" do
    visit login_path

    fill_in "email", with: admin.email
    fill_in "password", with: admin.password
    click_button("Login")

    visit admin_users_path(admin)

    within(".user-#{admin.id}") do
      expect(page).not_to have_content('delete')
    end
  end

  scenario "a default user cannot delete a user" do
    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button("Login")

    visit admin_users_path(admin)

    expect(page).not_to have_content(user.first_name)
    expect(page).to have_content("you do not have permission")
  end
end
