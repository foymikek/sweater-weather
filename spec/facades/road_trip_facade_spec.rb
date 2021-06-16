require 'rails_helper'

RSpec.describe 'RoadTrip Facade' do
  it 'can return a Trip obj', :vcr do
    trip = RoadTripFacade.trip_info('Denver,CO', 'Gunnison,CO')
    
    expect(trip.class).to eq(Trip)
    expect(trip.end_city).to be_a(String)
    expect(trip.start_city).to be_a(String)
    expect(trip.travel_time).to be_a(String)
    expect(trip.weather_at_eta).to be_a(Hash)
    expect(trip.weather_at_eta[:temperature]).to be_a(Numeric)
    expect(trip.weather_at_eta[:conditions]).to be_a(String)
  end

  it "round hour up if min's more than 30" do
    travel_time = "03:38:50"

    expect(RoadTripFacade.trip_duration(travel_time)).to eq(4)
  end

  it "round hour down if min's less than 30" do
    travel_time = "03:28:50"
    
    expect(RoadTripFacade.trip_duration(travel_time)).to eq(3)
  end
end