class OpenWeatherService
  class << self
    def forecast_query_db(lat, lng)
      response = conn.get('/data/2.5/onecall') do |req|
          req.params['lat']   = lat
          req.params['lon']   = lng
          req.params['units'] = 'imperial'
      end

      parse_json(response)
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