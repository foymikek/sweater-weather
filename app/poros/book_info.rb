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
        isbn: data[:docs][0][:isbn],
        title: data[:docs][0][:title],
        publisher: data[:docs][0][:publisher]
      }
    end
  end
end