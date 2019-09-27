require "rails_helper"

feature "Create a post comment" do
  include_context "current user signed in"

  let(:post) { create :post }

  background do
    visit post_path(post)
  end

  scenario "User creates a comment" do
    fill_in "comment_text", with: "some user comment"
    click_on "Create Comment"

    expect(page).to have_content("Comment was successfully created.")

    visit post_path(post)

    expect(page).to have_content("some user comment")
  end
end
