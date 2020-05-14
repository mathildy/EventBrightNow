class AttendancesController < ApplicationController

   def index
    @attendances = Attendance.all
   end 
   
   def new
    @events = Event.new
   
      #@event = Event.find(params[:id])
  
    @attendances = Attendance.all
   end 

   def show
    @attendances = Attendance.find(params[:id])
    @events = Event.find(params[:id])

   end 

   def create
    @attendances = Attendance.new(attendance_params)
        
        if @attendances.save
          flash[:success] = "Your attendance has been created."
          redirect_to event_path(@events.id)
        else
          messages = []
          if @attendances.errors.any? 
            @attendances.errors.full_messages.each do |message| 
              messages << message
            end 
            flash[:error] = "You failed, find the following errors :#{messages.join(" ")}"
            render 'new'
          end
        end
    end
      
      private
      
      def attendance_params
        params.permit(:event_id, :user_id, :stripe_customer_id)
      end
end
