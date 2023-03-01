class AttendanceController < ApplicationController

    def index
      @guests = User.joins(:attendances).where('attendances.event_id = ?', params[:event_id])
      @event = Event.find(params[:event_id])
      @admin = User.find(@event.admin_id)
    end
  
    def show
    end

end
