class Api::V1::ForecastController < ApplicationController
  def index
    # require 'pry'; binding.pry
    location = params[:location]

    conn = Faraday.new("http://www.mapquestapi.com") do |f|
        f.params['key'] = ENV['map_api_key']
      end

    response = conn.get("/geocoding/v1/address") do |r|
        r.params['location'] = location
      end
    
    data = JSON.parse(response.body, symbolize_names: true)

    lat = data[:results][0][:locations][0][:latLng][:lat]
    lng = data[:results][0][:locations][0][:latLng][:lng]
    
    conn = Faraday.new(url: 'http://api.openweathermap.org') do |f|
      f.params['appid'] = ENV['weather_api_key']
    end
    
    response = conn.get('/data/2.5/onecall') do |req|
        req.params['lat'] = lat
        req.params['lon'] = lng
        req.params['units'] = 'imperial'
      end

    data = JSON.parse(response.body, symbolize_names: true)

    
    daily_weather = data[:daily][0..4].map do |daily_data|
      DailyWeather.new(daily_data)
    end
    
    hourly_weather = data[:hourly][0..7].map do |hourly_data|
      HourlyWeather.new(hourly_data)
    end
    
    json_input = Weather.new(CurrentWeather.new(data), daily_weather, hourly_weather)

    render json: ForecastSerializer.new(json_input)
  end
end