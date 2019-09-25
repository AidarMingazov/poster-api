class MyPostsController < ApplicationController
  before_action :authorize_resource

  expose_decorated :posts, :fetch_posts
  expose :comment, -> { Comment.new }
  expose :rating, -> { Rating.new }

  private

  def fetch_posts
    current_user.posts.order(created_at: :desc).page(page).per(10)
  end

  def authorize_resource
    authorize posts
  end

  def page
    params[:page]
  end
end
