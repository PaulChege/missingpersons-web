class HomeController < ApplicationController
  def index
    @solved_cases = Case.where(status: 'solved').count
    @new_sightings = Sighting.all.count
    @new_cases = Case.all.count
    @new_users = PublicUser.all.count

    app = RailsPushNotifications::GCMApp.new
    app.gcm_key = 'AIzaSyBVRWVGOgg07GlWmnUlI4oJPbhUAFvMGHo'
    app.save

    notification = app.notifications.create(
        destinations: [
            'f3lz25vwk6A:APA91bHEqzbTdFY8WjOKZE3YxsO6fVqr5ofiNtdCTPCvQaYVKVhrhxIfKbtC-VffvaZKuzOXWR9RdFictyaLoD2w9r_OD3iv8T_c9Ynlu4cFJE3ghRlbrmpxNwnm6F1SagB7duz1_3Va'
        ],
        data: { message: 'Hello GCM World!' }
    )
    app.push_notifications
    
  end
end
