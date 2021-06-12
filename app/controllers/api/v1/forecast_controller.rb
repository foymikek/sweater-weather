class Api::V1::ForecastController < ApplicationController
  def index
    render json: {}, status: 200
  end
end