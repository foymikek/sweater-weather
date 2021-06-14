class Api::V1::BooksController < ApplicationController
  def index
    location =  TripInfo.new(params[:location])
    conn = Faraday.new("http://openlibrary.org") 
    
    response = conn.get("search.json?q=denver co") do |r|
      r.params['location'] = location.destination
    end
    data = JSON.parse(response.body, symbolize_names: true)
    book_weather_poro = ForecastFacade.book_forecast_query(location.destination)
    require 'pry'; binding.pry
  end
end