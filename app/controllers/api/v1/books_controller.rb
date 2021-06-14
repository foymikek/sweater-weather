class Api::V1::BooksController < ApplicationController
  def index
    book_search_poro = ForecastFacade.book_forecast_query(params[:location])
    
    render json: BooksSerializer.new(book_search_poro)
  end
end