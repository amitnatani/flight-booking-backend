# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlightService do
  describe 'data' do
    it 'should return flight data' do
      airline = create(:airline, name: 'Indigo')
      departure_time = Time.now + 2.hours
      arrival_time = Time.now + 4.hours
      flight = create(:flight, airline: airline, departure_time: departure_time, arrival_time: arrival_time)
      params = {
        source: 'Jaipur',
        destination: 'Mumbai',
        travel_date: departure_time.strftime("%Y-%m-%d")
      }
      data = FlightService.new(params).data.as_json
      expect(data["flights"].length).to eq 1
      expect(data["search_results"]).to eq 1
    end
  end
end
