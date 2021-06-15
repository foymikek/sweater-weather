class FlickrFacade
  class << self
    def get_image(location)
      id_image = FlickrService.get_image_id_db(location)[:photos][:photo][0][:id]
       
      image_poro_input = FlickrService.get_image_db(id_image)
      Image.new(image_poro_input, location)
    end
  end
end