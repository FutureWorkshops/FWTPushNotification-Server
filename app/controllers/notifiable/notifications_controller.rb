
module Notifiable
  
  class NotificationsController < Notifiable.api_controller_class
    
    before_filter :ensure_current_notifiable_user!, :find_notification_status!, :check_authorisation!
    
    def opened      
      if @notification_status.opened! && @notification_status.notification.increment!(:opened_count)
        head :status => :ok
      else
        render :json => { :errors => @notification_status.errors.full_messages }, :status => :unprocessable_entity
      end
      
    end
    
    private
    def find_notification_status!
      return head :status => :not_acceptable unless params[:notification_id] && params[:device_token] && (params[:device_token][:device_id] || params[:device_token][:token])
      device_token = params[:device_token][:device_id] ? 
        DeviceToken.find_by!("device_id = ?", params[:device_token][:device_id]) :  
        DeviceToken.find_by!("token = ?", params[:device_token][:token])
      
      @notification_status = NotificationStatus.find_by!("notification_id = ? AND device_token_id = ?", params[:notification_id], device_token.id)
    end
    
    def check_authorisation!
      head :status => :not_acceptable unless current_notifiable_user == @notification_status.device_token.user
    end
    
    def ensure_current_notifiable_user!
      head :status => :not_acceptable unless current_notifiable_user
    end
  end
  
end