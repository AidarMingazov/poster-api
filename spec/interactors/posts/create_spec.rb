require "rails_helper"

describe Posts::Create do
  subject(:context) { described_class.call(params: params, current_user: current_user) }

  let(:params) { { title: "title", body: "body" } }
  let(:current_user) { create :user }

  it "success" do
    expect(context.success?).to be_truthy
  end

  it "creates post" do
    expect(context.post.title).to eq("title")
    expect(context.post.body).to eq("body")
  end

  context "when params is invalid" do
    let(:params) { { title: nil, body: nil } }

    it "is not create a post" do
      expect(context.success?).to be_falsey
      expect(context.errors).to eq("Body can't be blank, Title can't be blank")
    end
  end
end
