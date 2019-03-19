module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    redirect_to new_user_session_path, alert: I18n.t("flash.user_not_authorized")
  end
end
