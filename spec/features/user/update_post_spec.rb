require "rails_helper"

feature "Update post" do
  include_context "current user signed in"

  let!(:post) { create :post, user: current_user }

  background do
    visit edit_post_path(post)
  end

  scenario "User updates a post" do
    fill_in "Post title", with: "title for post"
    fill_in "Post body", with: "body for post"
    fill_in "Post url", with: "slug_1"
    click_on "Update Post"

    expect(page).to have_content("title for post")
    expect(page).to have_content("body for post")
    expect(post.reload.slug).to eq("slug_1")
  end

  context "with invalid params" do
    scenario "User updates a post" do
      fill_in "Post title", with: ""
      fill_in "Post body", with: "body"
      click_on "Update Post"

      expect(page).to have_content("Post could not be updated.")
    end
  end
end
