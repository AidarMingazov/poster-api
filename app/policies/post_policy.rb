class PostPolicy < ApplicationPolicy
  def new?
    true
  end

  def index?
    list_owner?
  end

  def edit?
    owner? || admin?
  end

  def create?
    true
  end

  def update?
    owner? || admin?
  end

  def archived?
    (owner? || admin?) && !record.archived?
  end

  def published?
    (owner? || admin? || record.new_record?) && record.draft?
  end
end
