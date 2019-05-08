class AttendancesController < ApplicationController

  def new
  end

  def create
    @attendance = Attendance.new(stripe_customer_id: rand(1000..9999), participant_id: current_user.id, event_id: params[:event_id])
    if @attendance.save
      flash[:success] = "You have been successfully registered!"
      redirect_to root_path
    else
      flash[:danger] = "Error"
      render "new"
    end
  end
end
