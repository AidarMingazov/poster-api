module Api
  module V1
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception

      before_action :authenticate

      include ActionController::Serialization

      protected

      def authenticate
        current_user || unauthorized
      end

      def current_user
        @current_user ||= User.find_by(authentication_token: auth_token_value)
      end

      def unauthorized
        render_error I18n.t("errors.unauthorized"), :unauthorized if current_user.blank?
      end

      def auth_token_value
        request.headers["X-Auth-Token"].presence
      end

      private

      def render_error(errors, status = 422)
        render json: { errors: errors }, status: status
      end
    end
  end
end
