require "rails_helper"

feature "Create post" do
  let!(:post) { create :post }

  scenario "User creates post" do
    visit post_path(post)

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
  end
end
