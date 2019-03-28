require "rails_helper"

feature "Update post" do
  include_context "current admin signed in"

  let!(:post) { create :post, user: current_user }

  background do
    visit edit_admin_post_path(post)
  end

  scenario "Admin updates a post" do
    fill_in "Post title", with: "title for post"

    click_on "Update Post"

    expect(post.reload.title).to eq("title for post")
  end

  scenario "Admin archived a post" do
    check "Archived"

    click_on "Update Post"

    expect(post.reload.archived).to eq(true)
  end
end
