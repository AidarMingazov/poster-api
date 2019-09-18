require "rails_helper"

describe RatingPolicy do
  subject(:policy) { described_class }

  let(:record) { create :post }
  let(:user) { create :user }

  permissions :create? do
    it "denies access if user puts rating a post" do
      create :rating, post: record, user: user

      expect(policy).not_to permit(user, record)
    end

    it "accept access if user do not put rating a post" do
      expect(policy).to permit(user, record)
    end
  end
end
