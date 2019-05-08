class EventsController < ApplicationController
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
end
