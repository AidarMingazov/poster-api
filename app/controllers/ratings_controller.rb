class RatingsController < ApplicationController
  expose_decorated :post, find_by: :slug
  expose :rating

  before_action :authorize_resource

  def create
    rating.save
  end

  private

  def rating_params
    params.require(:rating).permit(:point).merge(user: current_user, post: post)
  end

  def authorize_resource
    authorize rating.post
  end
end
