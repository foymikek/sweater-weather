class Api::V1::RoadTripController < ApplicationController
  def create
    origin      = params[:origin]
    destination = params[:destination]
    user = User.find_by(api_key: params[:api_key])
    if user
      trip = RoadTripFacade.trip_info(params[:origin], params[:destination])
      
      render json: RoadTripSerializer.new(trip)
    else 
       render json: "Invalid Credentials", status: 401
    end
  end
end