require 'rails_helper'

RSpec.describe 'List events', :type => :request  do
  let!(:event) { FactoryGirl.create_list(:event, 3)}
  let(:response_body) { JSON.parse(response.body) }
  before { get "/api/events/list_events" }

  describe 'fetching events' do

    it "should have a 200 status" do
      expect(response.status).to eq 200
    end

    it "contains all events" do
      expect(response_body.count).to eq 3
    end

    it "returns correct details" do
      expect(response_body[0]).to have_key("id")
      expect(response_body[0]).to have_key("title")
      expect(response_body[0]).to have_key("description")
      expect(response_body[0]).to have_key("info")
      expect(response_body[0]).to have_key("start_time")
      expect(response_body[0]).to have_key("end_time")
    end
  end
end
