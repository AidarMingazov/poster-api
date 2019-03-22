class PostPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def edit?
    owner?
  end

  def create?
    user.present?
  end

  def update?
    owner?
  end
end
