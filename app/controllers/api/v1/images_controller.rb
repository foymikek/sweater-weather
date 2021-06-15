class Api::V1::ImagesController < ApplicationController
  def index
    image_poro = FlickrFacade.get_image(params[:location])

    render json: ImageSerializer.new(image_poro)
  end
end