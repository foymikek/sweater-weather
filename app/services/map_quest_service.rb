class MapQuestService
  class << self
    def location_coords_db(location)
      response = conn.get("/geocoding/v1/address") do |r|
          r.params['location'] = location
        end

      parse_json(response)
    end

    def trip_duration_db(origin, destination)
      response = conn.get("/directions/v2/route") do |r|
        r.params['from'] = origin
        r.params['to'] = destination
      end 
      parse_json(response)[:route]
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