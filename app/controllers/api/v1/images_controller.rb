class Api::V1::ImagesController < ApplicationController
  def index
  location = params[:location]
    conn = Faraday.new(url: 'https://www.flickr.com') do |f|
      f.params['api_key'] = ENV['flickr_api_key']
     end

    response = conn.get('/services/rest') do |f|
      f.params['method'] = 'flickr.photos.search'
      f.params['text'] = location
      f.params['per_page'] = 1
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = 1
    end

    data = JSON.parse(response.body, symbolize_names: true)
    id_image = data[:photos][:photo][0][:id]
    response = conn.get('/services/rest') do |f|
      f.params['method'] = 'flickr.photos.getInfo'
      f.params['photo_id'] = id_image
      f.params['page'] = 1
      f.params['per_page'] = 1
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = 1
    end
    image_poro_input = JSON.parse(response.body, symbolize_names: true)
    image_poro = Image.new(image_poro_input, location)
    # image_url: data[:photo][:urls][:url][0][:_content]
    # author: data[:photo][:owner][:username]
    require 'pry'; binding.pry
    render json: ImageSerializer.new(image_poro)
  end
end
# iamges_json_input = ImagesFacade.images_query(params[:location])
# render json: ImagesSerializer.new(images_json_input)