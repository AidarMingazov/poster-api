class PostsController < ApplicationController
  around_action :skip_bullet, only: %i[index]
  expose_decorated :post
  expose_decorated :posts, :fetch_posts

  before_action :authorize_resource, except: %i[index show]

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
    Post.order(created_at: :desc).all.page(params[:page]).per(10)
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_resource
    authorize post
  end
end
