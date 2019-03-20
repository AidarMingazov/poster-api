class PostDecorator < ApplicationDecorator
  delegate :title, :body, :author

  def author
    post.user.full_name
  end
end
