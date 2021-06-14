class BookSearch
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books,
              :id

  def initialize(location, book_weather_poro, book_info_poro)
    @id                = nil
    @destination       = location
    @forecast          = book_weather_poro
    @total_books_found = book_info_poro.total_books_found
    @books             = book_info_poro.books
  end
end