class RoadTripFacade
  class << self
    def trip_info(origin, destination)
      data = MapQuestService.trip_duration_db(origin, destination)
      require 'pry'; binding.pry
      travel_hour  = trip_duration(data[:formattedTime])
      weather_data = OpenWeatherService.forecast_query_db(
        data[:boundingBox][:lr][:lat],
        data[:boundingBox][:lr][:lng]
      )[:hourly][travel_hour]

      Trip.new(origin, destination, data, weather_data)
    end

    def trip_duration(travel_time)
      if Time.parse(travel_time).min < 30
        Time.parse(travel_time).hour
      else
        Time.parse(travel_time).hour + 1
      end
    end
  end
end