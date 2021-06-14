class BookInfo
  attr_reader :total_books_found,
              :books

  def initialize(data)
    @total_books_found = data[:num_found]
    @books = books_attribute(data)
  end

  def books_attribute(data)
    data[:docs][0..4].map do |book_info|
      {
        isbn: book_info[:isbn],
        title: book_info[:title],
        publisher: book_info[:publisher]
      }
    end
  end
end