require "rails_helper"

feature "Update Account", js: true do
  include_context "current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User updates account with valid data" do
    fill_form(:user, :edit, full_name: "New Name")
    click_on "Update"

    expect(page).to have_content("New Name")
  end

  scenario "User updates account avatar with valid data" do
    attach_file "user[avatar]", Rails.root.join("spec", "support", "fixtures", "avatar.png")
    click_on "Update"

    expect(current_user.reload.avatar_identifier).to eq("avatar.png")
  end

  scenario "User enters not matched passwords" do
    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end
end
