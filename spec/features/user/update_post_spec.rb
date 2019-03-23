require "rails_helper"

feature "Update post" do
  include_context "current user signed in"

  let!(:post) { create :post, user: current_user }

  scenario "User updates a post" do
    visit edit_post_path(post)

    fill_in "Post title", with: "title for post"
    fill_in "Post body", with: "body for post"
    click_on "Update Post"

    expect(page).to have_content("title for post")
    expect(page).to have_content("body for post")
  end

  context "with invalid params" do
    scenario "User updates a post" do
      visit edit_post_path(post)

      fill_in "Post title", with: ""
      fill_in "Post body", with: "body"
      click_on "Update Post"

      expect(page).to have_content("Post could not be updated.")
    end
  end
end
