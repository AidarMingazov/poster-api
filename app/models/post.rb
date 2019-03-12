class Post < ApplicationRecord
  validates :body, :title, :user, presence: true

  belongs_to :user
end
