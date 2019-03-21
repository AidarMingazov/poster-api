class PostsController < ApplicationController
  expose_decorated :post

  before_action :authorize_resource

  def new
  end

  def edit
  end

  def create
    post = current_user.posts.create(post_params)
    
    respond_with post
  end


  def update
    post.update(post_params)

    respond_with post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_resource
    authorize post
  end
end
