class EventSubmissionsController < ApplicationController
  def edit
    @event = Event.find(params[:id]).update(validated: true)
    flash[:success] = "Event validated!"
    redirect_to admin_index_path
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(validated: true)
      flash[:success] = "Event validated!"
      redirect_to admin_index_path
    else
      render :edit
    end
  end
end