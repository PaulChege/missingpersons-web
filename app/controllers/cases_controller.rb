class CasesController < ApplicationController

  def index
    @cases = Case.all
  end

  def show
    @c = Case.find(params[:id])
    @matches = @c.matches
  end

  def send_notification

    @c = Case.find(params[:id])
    @c.status=params[:status]
    
    if @c.save
      app = RailsPushNotifications::GCMApp.new
      app.gcm_key = 'AIzaSyBVRWVGOgg07GlWmnUlI4oJPbhUAFvMGHo'
      app.save

      notification = app.notifications.create(
          destinations: [
              @c.public_user.notification_token
          ],
          data: {  message: "Case #" + params[:id] + ": " +params[:status],}
          
      )
      app.push_notifications
    end
    redirect_back fallback_location: root_path


  end


end
