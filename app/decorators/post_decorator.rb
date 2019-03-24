class PostDecorator < ApplicationDecorator
  delegate :title, :body, :author, :user, :slug

  def author
    post.user.full_name
  end
end
