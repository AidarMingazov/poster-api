class CommentDecorator < ApplicationDecorator
  delegate :text, :user, :author_full_name

  def author_full_name
    user.full_name
  end
end
