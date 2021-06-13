class ForecastFacade
  class << self
    def forecast_query(location)
      lat_n_lng = ForecastFacade.location_coords(location)      

      conn = Faraday.new(url: 'http://api.openweathermap.org') do |f|
        f.params['appid'] = ENV['weather_api_key']
      end

      response = conn.get('/data/2.5/onecall') do |req|
          req.params['lat'] = lat_n_lng.lat
          req.params['lon'] = lat_n_lng.lng
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
    end

    def location_coords(location)
      conn = Faraday.new("http://www.mapquestapi.com") do |f|
          f.params['key'] = ENV['map_api_key']
        end
      
      response = conn.get("/geocoding/v1/address") do |r|
          r.params['location'] = location
        end
      
      data = JSON.parse(response.body, symbolize_names: true)
      
      LatNLng.new(data)
    end
  end
end