require "rails_helper"
feature "Show a comment" do
  let(:post) { create :post }
  let!(:comment_1) { create :comment, post: post }
  let!(:comment_2) { create :comment, post: post }

  scenario "Visitor views a post" do
    visit post_path(post)

    expect(page).to have_content(comment_1.text)
    expect(page).to have_content(comment_2.text)
  end
end
