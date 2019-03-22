class PostDecorator < ApplicationDecorator
  delegate :title, :body, :author, :user

  def author
    post.user.full_name
  end
end
