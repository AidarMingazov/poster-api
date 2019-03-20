class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, presence: true

  before_create :generate_authentication_token

  private

  def generate_authentication_token
    self.authentication_token = SecureRandom.hex
  end
end
