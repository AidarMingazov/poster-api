class PostDecorator < ApplicationDecorator
  delegate :title, :body, :author, :user, :slug, :archived

  decorates_association :comments

  def author
    post.user.full_name
  end
end
