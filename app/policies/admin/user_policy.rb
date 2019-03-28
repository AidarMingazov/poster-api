module Admin
  class UserPolicy < BasePolicy
    def index?
      admin?
    end

    def edit?
      admin?
    end

    def update?
      admin?
    end
  end
end
