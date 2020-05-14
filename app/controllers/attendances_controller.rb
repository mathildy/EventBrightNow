class AttendancesController < ApplicationController

  def index
    @events = Event.find(params[:id])
    @attendances = @events.attendances
    unless current_user == @event.admin
      flash[:failure] = "Not authorized"
      redirect_to root_path
    end
  end

  def new
    @event = Event.find(params[:id])
  end

  def create
    @attendances = Attendance.new(user_id: params[:user_id], event_id: params[:event_id], stripe_customer_id: params[:customer_id])

    if @attendances.save
      flash[:success] = "Event registration successfully saved"
      redirect_to root_path
    else
      flash[:failure] = "Event registration saving failed"
      redirect_to root_path
    end
  end
private

  def attendance_params
    params.permit(:event_id, :user_id, :stripe_customer_id)
  end

end