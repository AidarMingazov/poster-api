class Rating < ApplicationRecord
  validates :post, :user, presence: true
  validates :point, inclusion: 1..5, presence: true

  belongs_to :user
  belongs_to :post
end
