class Api::V1::RoadTripController < ApplicationController
  def create
    origin      = params[:origin]
    destination = params[:destination]
    user = User.find_by(api_key: params[:api_key])
    if user
      conn = Faraday.new("http://www.mapquestapi.com") do |f|
        f.params['key'] = ENV['map_api_key']
      end

      response = conn.get("/directions/v2/route") do |r|
        r.params['from'] = origin
        r.params['to'] = destination
      end 
      data = JSON.parse(response.body, symbolize_names: true)
      #travel_time: data[:route][:formattedTime]
      travel_time = data[:route][:formattedTime]
      travel_hour = Time.parse(travel_time).hour
      lat = data[:route][:boundingBox][:lr][:lat]
      lng = data[:route][:boundingBox][:lr][:lng]
      destination_weather_data = OpenWeatherService.forecast_query_db(lat, lng) 
      destination_weather = destination_weather_data[:hourly][travel_hour]
      #weather_at_eta.temperature: destination_weather[:current][:temp]
      #weather_at_eta.conditions: destination_weather[:current][:weather][0][:description]
      trip = Trip.new(origin, destination, data, destination_weather)
      render json: RoadTripSerializer.new(trip)
    end
  end
end