class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create!(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location], admin_id: current_user.id)
    if @event.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
