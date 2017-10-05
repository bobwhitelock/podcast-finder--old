class NotificationRequestsController < ApplicationController
  def create
    notification_request = NotificationRequest.new(notification_request_params)
    if notification_request.save
      flash[:success] = "I'll email you daily!"
    else
      flash[:danger] = "Something went wrong!"
    end
    redirect_to root_path
  end

  private

  def notification_request_params
    params.require(:notification_request).permit(:query, :email)
  end
end
