require "rails_helper"
feature "Show a post" do
  let!(:post) { create :post }
  scenario "User views a post" do
    visit post_path(post)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
  end
end
