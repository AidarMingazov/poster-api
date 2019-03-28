require "rails_helper"
feature "List posts" do
  let!(:post_1) { create :post, title: "some title", body: "text body" }
  let!(:post_2) { create :post, title: "new title", body: "some body text" }
  let!(:post_3) { create :post, archived: true }

  background do
    visit posts_path
  end

  scenario "Visitor sees list posts" do
    expect(page).to have_content(post_1.title)
    expect(page).to have_content(post_1.body)
    expect(page).to have_content(post_2.title)
    expect(page).to have_content(post_2.body)
    expect(page).not_to have_content(post_3.body)
  end

  scenario "Visitor searches posts" do
    fill_in "q_body_or_title_cont", with: "new"
    click_on "Search"

    expect(page).to have_content(post_2.title)
    expect(page).to have_content(post_2.body)
    expect(page).not_to have_content(post_1.title)
  end
end
