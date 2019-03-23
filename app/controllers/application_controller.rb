class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html
end
