class PostDecorator < ApplicationDecorator
  delegate :title, :body, :author, :user, :slug

  decorates_association :comments

  def author
    post.user.full_name
  end
end
