class Api::V1::ForecastController < ApplicationController
  def index
    weather_json_input = ForecastFacade.forecast_query(params[:location])

    render json: ForecastSerializer.new(weather_json_input)
  end
end