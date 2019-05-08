class HomeController < ApplicationController
  def index
    @event = Event.order("created_at ASC")
  end
end
