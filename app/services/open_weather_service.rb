class OpenWeatherService
  class << self
    def forecast_query_db(lat, lng)
      response = conn.get('/data/2.5/onecall') do |req|
          req.params['lat'] = lat
          req.params['lon'] = lng
          req.params['units'] = 'imperial'
      end

      data = parse_json(response)
      
      daily_weather = data[:daily][0..4].map do |daily_data|
        DailyWeather.new(daily_data)
      end

      hourly_weather = data[:hourly][0..7].map do |hourly_data|
        HourlyWeather.new(hourly_data)
      end
      Weather.new(CurrentWeather.new(data), daily_weather, hourly_weather)
    end

    private

    def conn
      Faraday.new(url: 'http://api.openweathermap.org') do |f|
        f.params['appid'] = ENV['weather_api_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end