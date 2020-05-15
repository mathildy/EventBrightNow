class AvatarsController < ApplicationController
    def new
    end
    
    def create
        @events = Event.find(params[:event_id])
        @events.avatar.attach(params[:avatar])
        redirect_to(event_path(@events))
      end
end
