class ForecastFacade
  class << self
    def forecast_query(location)
      lat_n_lng = ForecastFacade.location_coords(location)      
      
      OpenWeatherService.forecast_query_db(lat_n_lng.lat, lat_n_lng.lng)
    end

    def location_coords(location)
      data = MapQuestService.location_coords_db(location)

      LatNLng.new(data)
    end
  end
end