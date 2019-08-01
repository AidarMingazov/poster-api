class RatingDecorator < ApplicationDecorator
  delegate :point, :user
end
