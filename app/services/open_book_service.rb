class OpenBookService < BaseService
  class << self
    def books_by_location(location)
      response = conn('http://openlibrary.org').get("/search.json?q=#{location}")
      
      format_json(response)
    end

  end
end