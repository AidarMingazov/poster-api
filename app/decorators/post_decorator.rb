class PostDecorator < ApplicationDecorator
  delegate :title, :body, :author_full_name, :user, :slug, :average_rate, :status,
    :draft?, :archived?, :published?, :new_record?, :average_rate

  decorates_association :comments
  decorates_association :ratings

  def author_full_name
    user.full_name
  end

  def average_rate
    object.ratings.average(:point)
  end
end
