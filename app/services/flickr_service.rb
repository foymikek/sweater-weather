class FlickrService
  class << self
    def get_image_id_db(location)
      response = conn.get('/services/rest') do |f|
        f.params['method']   = 'flickr.photos.search'
        f.params['text']     = location
        f.params['per_page'] = 1
        f.params['format']   = 'json'
        f.params['nojsoncallback'] = 1
      end
      parse_json(response)
    end
    
    def get_image_db(id_image)
      response = conn.get('/services/rest') do |f|
        f.params['method']         = 'flickr.photos.getInfo'
        f.params['photo_id']       = id_image
        f.params['page']           = 1
        f.params['per_page']       = 1
        f.params['format']         = 'json'
        f.params['nojsoncallback'] = 1
      end
      parse_json(response)
    end

    private

    def conn
      Faraday.new(url: 'https://www.flickr.com') do |f|
        f.params['api_key'] = ENV['flickr_api_key']
       end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end