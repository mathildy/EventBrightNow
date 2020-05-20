class AttendancesController < ApplicationController

  def index
    @events = Event.find(params[:id])
    @attendances = @events.attendances
    unless current_user == @event.admin
      flash[:error] = "Vous n'êtes pas autorisés."
      redirect_to root_path
    end
  end

  def new
    @event = Event.find(params[:id])
    @attendances = Attendance.all 

  end

  def create
    #@event = Event.find(params[:id])
    @attendances = Attendance.new(user_id: params[:user_id], event_id: params[:event_id], stripe_customer_id: params[:customer_id])

    if @attendances.save
      flash[:success] = "Vous êtes bien enregistrés !"
      redirect_to root_path
    else
      flash[:error] = "Vous n'avez pas pu vous enregistrer."
      redirect_to root_path
    end
  end
private

  def attendance_params
    params.permit(:event_id, :user_id, :stripe_customer_id)
  end

end