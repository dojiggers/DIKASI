class NotificationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_notification, only: [:show, :mark_as_read]
  
    def index
      @notifications = current_user.notifications.order(created_at: :desc)
    end
  
    def show
      @notification.update(read_at: Time.zone.now) if @notification.unread?
    end
  
    def mark_as_read
      @notification.update(read_at: Time.zone.now) if @notification.unread?
      redirect_to notifications_path
    end
  
    private
  
    def set_notification
      @notification = current_user.notifications.find(params[:id])
    end
  end
  