class PostsController < ApplicationController
  expose_decorated :post

  before_action :authorize_resource, only: %i[new edit create update]

  def new
  end

  def edit
  end

  def create
    respond_with create_post
  end

  def update
    respond_with update_post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_resource
    authorize post
  end

  def create_post
    Post::Create.call!(params: post_params, current_user: current_user).post
  end

  def update_post
    Post::Update.call!(params: post_params, post: post, current_user: current_user).post
  end
end
