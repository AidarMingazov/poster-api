require "rails_helper"

feature "Update post" do
  include_context "current user signed in"

  let(:post) { create :post, user: current_user }

  background do
    visit edit_post_path(post)
  end

  scenario "User archived a post" do
    fill_in "Post title", with: "title for post"
    fill_in "Post body", with: "body for post"
    click_on "Archived"

    expect(post.reload.status).to eq "archived"
  end
end
