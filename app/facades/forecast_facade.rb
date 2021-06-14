class ForecastFacade
  class << self
    def forecast_query(location)
      lat_n_lng = ForecastFacade.location_coords(location)

      data = OpenWeatherService.forecast_query_db(lat_n_lng.lat, lat_n_lng.lng)

      daily_weather  = data[:daily][0..4].map do |daily_data|
        DailyWeather.new(daily_data)
      end

      hourly_weather = data[:hourly][0..7].map do |hourly_data|
        HourlyWeather.new(hourly_data)
      end
      
      Weather.new(CurrentWeather.new(data[:current]), daily_weather, hourly_weather)
    end

    def location_coords(location)
      data = MapQuestService.location_coords_db(location)
      
      LatNLng.new(data)
    end

    def book_forecast_query(location)
    lat_n_lng = ForecastFacade.location_coords(location)
    book_weather_input = OpenWeatherService.forecast_query_db(lat_n_lng.lat, lat_n_lng.lng)
    book_info_input = OpenBookService.books_by_location(location)

    book_info_poro = BookInfo.new(book_info_input)


    book_weather_poro = BookWeather.new(book_weather_input)
    BookSearch.new(location, book_weather_poro, book_info_poro)
    end
  end
end