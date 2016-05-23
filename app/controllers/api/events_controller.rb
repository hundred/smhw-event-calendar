module Api
  class EventsController < ApplicationController

    def list_events
      @events = Event.all
    end

  end
end
