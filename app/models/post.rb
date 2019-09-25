class Post < ApplicationRecord
  include AASM
  extend FriendlyId
  extend Enumerize

  friendly_id :title, use: :slugged

  validates :body, :title, :user, presence: true
  validates :slug, uniqueness: { case_sensitive: false }, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :ratings

  enumerize :status, in: %i[draft published archived]

  aasm(:status) do
    state :draft, initial: true
    state :published
    state :archived

    event(:published) { transitions(from: %i[draft archived published], to: :published) }
    event(:archived) { transitions(from: %i[draft published], to: :archived) }
  end

  def average_rate
    ratings.present? ? ratings.average(:point).round(1) : "no rating"
  end
end
