require 'rails_helper'

RSpec.describe 'Create event', :type => :request  do
  let(:event) { { title: "New Event", description: "Maths class", info: "Mr Jonson", start_time: Date.today, end_time: Date.today } }
  before { post "/api/events", { event: event } }

  describe "when event is valid" do

    it "should return 200" do
      expect(response.status).to eq 201
    end

    it "should have created an event" do
      expect(Event.all.count).to eq 1
    end

    it "should have correct details" do
      created_event = Event.first
      expect(created_event.title).to eq event[:title]
      expect(created_event.description).to eq event[:description]
      expect(created_event.info).to eq event[:info]
      expect(created_event.end_time).to eq event[:start_time]
      expect(created_event.end_time).to eq event[:end_time]
    end
  end
end
