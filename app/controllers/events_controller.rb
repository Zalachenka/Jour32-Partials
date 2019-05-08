class EventsController < ApplicationController
  def index
    @event = Event.where(admin_id: current_user.id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin_id: current_user.id)
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
    @event.destroy
    redirect_to user_events_path(current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :admin_id)
  end

end
