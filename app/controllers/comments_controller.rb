class CommentsController < ApplicationController
  expose :post, find_by: :slug
  expose :comment

  before_action :authorize_resource

  def create
    comment.post = post
    comment.user = current_user

    if comment.save
      respond_with comment, location: posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post)
  end

  def authorize_resource
    authorize comment
  end
end
