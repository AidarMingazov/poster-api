require "rails_helper"

feature "Update post" do
  include_context "current user signed in"

  let!(:post) { create :post, user: current_user }

  scenario "User updates a post" do
    visit edit_post_path(post)

    fill_in "Post title", with: title
    fill_in "Post body", with: body
    click_on "Update Post"

    expect(page).to have_content("title")
    expect(page).to have_content("body")
  end
end
