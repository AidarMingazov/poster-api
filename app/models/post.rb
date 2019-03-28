class Post < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  validates :body, :title, :user, presence: true
  validates :slug, uniqueness: { case_sensitive: false }, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :active, -> { where(archived: false) }
end
