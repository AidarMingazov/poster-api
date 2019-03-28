module Admin
  class BasePolicy < ApplicationPolicy
    private

    def admin?
      user.role == "admin"
    end
  end
end
