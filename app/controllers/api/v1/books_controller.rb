class Api::V1::BooksController < ApplicationController
  def index
    location =  params[:location]
    conn = Faraday.new("http://openlibrary.org") 
    
    response = conn.get("search.json?q=denver co") do |r|
      r.params['location'] = location
    end
    data = JSON.parse(response.body, symbolize_names: true)
    book_weather_poro = ForecastFacade.book_forecast_query(location)
    book_info_poro = BookInfo.new(data)
    book_search_poro = BookSearch.new(location, book_weather_poro, book_info_poro)

    render json: BooksSerializer.new(book_search_poro)
  end
end