class MapQuestService
  class << self
    def location_coords_db(location)
      conn = Faraday.new("http://www.mapquestapi.com") do |f|
          f.params['key'] = ENV['map_api_key']
        end
      
      response = conn.get("/geocoding/v1/address") do |r|
          r.params['location'] = location
        end
        
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end