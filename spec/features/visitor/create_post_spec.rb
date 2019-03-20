require "rails_helper"

feature "Create a post" do
  scenario "Visitor creates a post" do
    visit new_post_path

    expect(page).to have_content("You are not authorized! Please sign in.")
  end
end
