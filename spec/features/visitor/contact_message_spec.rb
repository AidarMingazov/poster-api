require "rails_helper"

feature "Create a contact message" do
  let(:bcc) { "aidar.mingazov@flatstack.com" }
  let(:message) { "some message" }
  let(:visitor_email) { "example@example.com" }
  let(:expected_mail) { "#{visitor_email}, send #{message}" }

  scenario "Visitor creates a message" do
    visit new_contact_path

    fill_in "Your message", with: message
    fill_in "Your email address for response", with: visitor_email

    click_button "Send"

    expect(page).to have_content("Your message has been sent!")

    open_email(bcc)

    expect(current_email).to have_body_text(expected_mail)
  end
end
