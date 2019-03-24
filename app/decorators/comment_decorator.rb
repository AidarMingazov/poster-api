class CommentDecorator < ApplicationDecorator
  delegate :text
  delegate :full_name, to: :author, prefix: true

  def author
    @author ||= object.user.decorate
  end
end
