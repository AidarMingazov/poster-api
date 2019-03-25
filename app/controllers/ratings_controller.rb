class RatingsController < ApplicationController
  expose :post, find_by: :slug
  expose :rating

  before_action :authorize_resource

  def create
    rating.post = post
    rating.user = current_user
    rating.save
  end

  private

  def rating_params
    params.permit(:point, :post_id)
  end

  def authorize_resource
    authorize rating
  end
end
