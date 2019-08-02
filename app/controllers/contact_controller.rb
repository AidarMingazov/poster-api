class ContactController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    ApplicationMailer.contact(message, email).deliver_later

    redirect_to new_contact_path, notice: t("flash.contact_message")
  end

  private

  def contact_params
    params.require(:contact).permit(:message, :email)
  end

  def message
    contact_params[:message]
  end

  def email
    contact_params[:email] || current_user.email
  end
end
