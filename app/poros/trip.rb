class Trip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(from, to, trip_data, weather_data)
    @start_city     = from.sub(",", ", ").titleize
    @end_city       = to.sub(",", ", ").titleize
    @travel_time    = trip_data[:formattedTime]
    @weather_at_eta = {
      temperature: weather_data[:temp],
      conditions: weather_data[:weather][0][:description]
    }
  end
end