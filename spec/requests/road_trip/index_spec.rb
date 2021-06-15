require 'rails_helper'

RSpec.describe "Road Trip" do
  describe "happy path, index" do 
    it "trip details returns forecast info for destination info" do
      User.destroy_all
      User.create!(
        email: 'test_123@example.com',
        password: 'password123',
        api_key: "dc67de45f7a185f0baeb38135f96e7f062298b506033"
                    )

      query_params = {
                  "origin": "Denver,CO",
                  "destination": "Gunnison,CO",
                  "api_key": "dc67de45f7a185f0baeb38135f96e7f062298b506033"
                      }

      post "/api/v1/road_trip", params: query_params
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      trip_response = JSON.parse(response.body, symbolize_names: true)
      expect(trip_response).to be_a(Hash)
      expect(trip_response).to have_key :data

      expect(trip_response[:data]).to be_a(Hash)
      expect(trip_response[:data]).to have_key :id
      expect(trip_response[:data][:id]).to eq(nil)

      expect(trip_response[:data]).to have_key :type
      expect(trip_response[:data][:type]).to eq('road_trip')

      expect(trip_response[:data]).to have_key :attributes
      expect(trip_response[:data][:attributes]).to be_a(Hash)

      expect(trip_response[:data][:attributes]).to have_key :start_city
      expect(trip_response[:data][:attributes][:start_city]).to be_a(String)

      expect(trip_response[:data][:attributes]).to have_key :end_city
      expect(trip_response[:data][:attributes][:end_city]).to be_a(String)

      expect(trip_response[:data][:attributes]).to have_key :travel_time
      expect(trip_response[:data][:attributes][:travel_time]).to be_a(String)

      expect(trip_response[:data][:attributes]).to have_key :weather_at_eta
      expect(trip_response[:data][:attributes][:weather_at_eta]).to be_a(Hash)

      expect(trip_response[:data][:attributes][:weather_at_eta]).to have_key :temperature
      expect(trip_response[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)

      expect(trip_response[:data][:attributes][:weather_at_eta]).to have_key :conditions
      expect(trip_response[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end
end