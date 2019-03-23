class PostsController < ApplicationController
  before_action :authorize_resource, except: %i[index show]
  skip_before_action :authenticate_user!, only: %i[index show]

  expose_decorated :post
  expose_decorated :posts, :fetch_posts

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    post.user = current_user
    post.save

    respond_with post
  end

  def update
    post.update(post_params)

    respond_with post
  end

  private

  def fetch_posts
    Post.includes(:user).order(created_at: :desc).all.page(params[:page]).per(10)
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_resource
    authorize post
  end
end
