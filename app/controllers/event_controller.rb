class EventController < ApplicationController

    def index
        @events = Event.all
      end

    def show
        @event = Event.find(params[:id])
        @admin = User.find(@event.admin_id)
        @nb_guests = Attendance.where(event_id: @event.id).count
    end

    def new
        @event = Event.new
    end
    
      # POST /events
      # POST /events.json
    def create
        @event = Event.new(title: params[:title], 
          description: params[:description],
          location: params[:location],
          price: params[:price],
          start_date: params[:start_date],
          duration: params[:duration],
          admin_id: current_user.id)
    
        if @event.save # essaie de sauvegarder en base @gossip
            redirect_to :controller => 'event', :action => 'show', id: @event.id
        else
          # This line overrides the default rendering behavior, which
          # would have been to render the "create" view.
          flash.now[:alert] = "Error with the account creation"
          render :action => 'new'
        end
    end
end
