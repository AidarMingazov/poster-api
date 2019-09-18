class RatingPolicy < ApplicationPolicy
  # record accept Post object
  def create?
    record.ratings.map(&:user).exclude?(user)
  end
end
