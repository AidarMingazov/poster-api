class User < ApplicationRecord
  extend Enumerize

  mount_uploader :avatar, AvatarUploader

  enumerize :role, in: %i[user admin], predicates: true, scope: true

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, presence: true
  has_many :posts
  has_many :comments
  has_many :ratings
end
