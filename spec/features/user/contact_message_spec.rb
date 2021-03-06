require "rails_helper"

feature "Create a contact message", js: true do
  include_context "current user signed in"

  let(:message) { "some message" }
  let(:expected_mail) { "#{current_user.email}, send #{message}" }

  scenario "User creates a message" do
    visit new_contact_path

    fill_in "Your message", with: message

    click_button "Send"

    expect(page).to have_content("Your message has been sent!")
  end
end
