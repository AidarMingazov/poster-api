require "rails_helper"

feature "Create a post" do
  include_context "current user signed in"

  scenario "User creates a post" do
    visit new_post_path

    fill_in "Post title", with: "title"
    fill_in "Post body", with: "body"
    click_on "Create Post"

    expect(page).to have_content("Post was successfully created.")
    expect(page).to have_content("title")
    expect(page).to have_content("body")
  end

  context "with invalid params" do
    scenario "User creates a post" do
      visit new_post_path

      fill_in "Post body", with: "body"
      click_on "Create Post"

      expect(page).to have_content("Post could not be created.")
    end
  end
end
