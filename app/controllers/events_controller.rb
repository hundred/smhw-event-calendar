class EventsController < ApplicationController

  def index
  end

  def edit
    @event = Event.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
