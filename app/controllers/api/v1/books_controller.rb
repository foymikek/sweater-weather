class Api::V1::BooksController < ApplicationController
  def index
    if params[:location] && ( params[:quantity] == '5' )
      book_search_poro = ForecastFacade.book_forecast_query(params[:location])
      
      render json: BooksSerializer.new(book_search_poro)
    else
      render json: {}, status: 403
    end
  end
end