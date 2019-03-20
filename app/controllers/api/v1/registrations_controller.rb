module Api
  module V1
    class RegistrationsController < Api::V1::ApplicationController
      skip_before_action :authenticate

      def create
        render json: created_user, serializer: RegisterUserSerializer, status: :created
      rescue ActiveRecord::RecordInvalid => invalid
        render_error(invalid.record.errors.full_messages.join(", "))
      end

      private

      def created_user
        User.create!(user_params)
      end

      def user_params
        params.require(:user).permit(:email, :password, :full_name)
      end
    end
  end
end
