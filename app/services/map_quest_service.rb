class MapQuestService < BaseService
  class << self
    def location_coords_db(location)
      response = conn.get("/geocoding/v1/address") do |r|
          r.params['location'] = location
        end
        
      parse_json(response)
    end

    private

    def conn
      Faraday.new("http://www.mapquestapi.com") do |f|
          f.params['key'] = ENV['map_api_key']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end