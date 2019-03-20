class User < ApplicationRecord
  before_create :generate_authentication_token

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, presence: true

  has_many :posts

  private

  def generate_authentication_token
    self.authentication_token = SecureRandom.hex
  end
end
