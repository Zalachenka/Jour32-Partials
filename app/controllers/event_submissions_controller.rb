class EventSubmissionsController < ApplicationController

  def update
    @event = Event.find(params[:id])
    if @event.update(validated: true)
      flash[:success] = "Event validated!"
      redirect_to admin_index_path
    else 
      redirect_to admin_index_path
    end
  end
end