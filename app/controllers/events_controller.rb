class EventsController < ApplicationController
  before_action :admin?, only: [:update, :destroy]

  def index
    @event = Event.where(admin_id: current_user.id)
  end

  def new
    @event = Event.new
  end

  def create
    if current_user.is_admin
      validation = true
    else
      validation = nil
    end
    
    @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin_id: current_user.id, validated: validation)
  
    @event.event_picture.attach(params[:event_picture])
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid event"
      render "new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Your event has been successfully updated!"
      redirect_to event_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @attendance = Attendance.where(event_id: @event.id) # quand on supprime un event on supprime toutes les participations
    @attendance.each do |a|
      a.destroy
    end
    @event.destroy
    flash[:success] = "Event deleted!"
    if current_user.is_admin != true 
      redirect_to user_events_path(current_user.id)
    else 
      redirect_to admin_index_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin_id)
  end

  def admin?
    if current_user.is_admin != true && current_user != Event.find(params[:id]).admin
      flash[:danger] = "Your not the admin!"
      redirect_to root_path
    end
  end
end
