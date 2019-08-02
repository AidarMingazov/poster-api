class PostsController < ApplicationController
  before_action :authorize_resource, except: %i[index show]
  skip_before_action :authenticate_user!, only: %i[index show]

  expose_decorated :post, find_by: :slug
  expose_decorated :posts, :fetch_posts
  expose :q, :fetch_query
  expose :comment, -> { Comment.new }
  expose :rating, -> { Rating.new }

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
    PostsQuery.new(fetch_query, params[:page]).all.active
  end

  def post_params
    params.require(:post).permit(:title, :body, :slug)
  end

  def authorize_resource
    authorize post
  end

  def fetch_query
    Post.ransack(params[:q])
  end
end
