class OpenBookService < BaseService
  class << self
    def books_by_location(location)
      response = conn.get("search.json?q=#{location}")
      
      parse_json(response)
    end

    private

    def conn
      Faraday.new("http://openlibrary.org") 
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end