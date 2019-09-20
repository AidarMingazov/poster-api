class Post < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged

  validates :body, :title, :user, presence: true
  validates :slug, uniqueness: { case_sensitive: false }, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings

  scope :active, -> { where(archived: false) }

  def average_rate
    ratings.present? ? ratings.average(:point).round(1) : "no rating"
  end
end
