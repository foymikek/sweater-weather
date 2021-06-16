require 'rails_helper'

RSpec.describe 'Trip object' do
  it 'abstracts and encapsulates Trip data that can be read' do
    trip = Trip.new(
      "Denver,CO",
      "Gunnison,CO",
      trip_data,
      weather_data

    )
    
    expect(trip).to be_a(Trip)
    expect(trip.end_city).to eq("Gunnison, Co")
    expect(trip.start_city).to eq("Denver, Co")
    expect(trip.travel_time).to eq("03:38:50")
    expect(trip.weather_at_eta).to eq(
      {
        :temperature=>71.85,
        :conditions=>"scattered clouds"
      }
    )
  end
end
