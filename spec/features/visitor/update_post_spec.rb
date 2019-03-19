require "rails_helper"

feature "Update a post" do
  let!(:post) { create :post }

  scenario "Visitor update a post" do
    visit edit_post_path(post)

    expect(page).to have_content("You are not authorized! Please sign in.")
  end
end
