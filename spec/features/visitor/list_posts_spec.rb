require "rails_helper"
feature "List posts" do
  let!(:post_1) { create :post }
  let!(:post_2) { create :post }
  scenario "Visitor sees list posts" do
    visit posts_path
    expect(page).to have_content(post_1.title)
    expect(page).to have_content(post_1.body)
    expect(page).to have_content(post_2.title)
    expect(page).to have_content(post_2.body)
  end
end
