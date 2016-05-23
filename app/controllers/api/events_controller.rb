module Api
  class EventsController < ApplicationController

    def list_events
      @events = Event.all
    end

    def create
      if Event.create(event_params)
        render status: 201, text: "OK"
      else
        render status: 500, text: "NOT OK"
      end
    end

    def update
      @event = Event.find(params[:id])
      if @event.update_attributes!(event_params)
        render status: 200, text: "OK"
      else
        render status: 500, text: "NOT OK"
      end
    end

    private

    def event_params
      params.require(:event).permit(:start_time, :end_time, :title, :description, :info)
    end
  end
end
