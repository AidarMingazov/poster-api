class PostPolicy < ApplicationPolicy
  def show?
    true
  end

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
