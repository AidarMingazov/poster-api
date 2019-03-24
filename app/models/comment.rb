class Comment < ApplicationRecord
  validates :post, :user, :text, presence: true

  belongs_to :user
  belongs_to :post
end
