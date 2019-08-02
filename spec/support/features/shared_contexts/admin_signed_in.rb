shared_context "current admin signed in" do
  let(:current_user) { create :user, :admin }

  background do
    login_as current_user
  end
end
