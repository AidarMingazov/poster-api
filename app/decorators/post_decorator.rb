class PostDecorator < ApplicationDecorator
  delegate :title, :body, :author_full_name, :user, :slug, :average_rate, :status

  decorates_association :comments
  decorates_association :ratings

  def author_full_name
    user.full_name
  end
end
