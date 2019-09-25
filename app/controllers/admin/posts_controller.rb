module Admin
  class PostsController < ApplicationController
    before_action :authorize_admin

    expose_decorated :post, find_by: :slug
    expose_decorated :posts, :fetch_posts
    expose :q, :fetch_query

    def index
    end

    def edit
    end

    def update
      post.update(post_params)

      redirect_to admin_posts_path
    end

    private

    def fetch_posts
      PostsQuery.new(fetch_query, params[:page]).all
    end

    def post_params
      params.require(:post).permit(:title, :body, :slug)
    end

    def fetch_query
      Post.ransack(params[:q])
    end

    def authorize_admin
      authorize([:admin, User])
    end
  end
end
