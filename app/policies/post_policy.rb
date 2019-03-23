class PostPolicy < ApplicationPolicy
  def new?
    true
  end

  def edit?
    owner?
  end

  def create?
    true
  end

  def update?
    owner?
  end
end
