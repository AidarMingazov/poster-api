class PostDecorator < ApplicationDecorator
  delegate :title, :body, :author, :user, :slug, :average_rate, :archived

  decorates_association :comments
  decorates_association :ratings

  def author
    post.user.full_name
  end

  def average_rate
    post.ratings.present? ? post.ratings.average(:point).round(1) : "no rating"
  end
end
