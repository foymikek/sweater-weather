require 'rails_helper'

RSpec.describe 'CurrentWeather object' do
  it 'abstracts and encapsulates CurrentWeather data that can be read' do
    book_info_poro = BookInfo.new(book_info_poro_input)

    expect(book_info_poro.total_books_found).to eq(606)
    expect(book_info_poro.books.class).to eq(Array)
    expect(book_info_poro.books[0].class).to eq(Hash)
    expect(book_info_poro.books[0][:isbn].class).to eq(Array)
    expect(book_info_poro.books[0][:isbn][0]).to eq("9780762507849")
    expect(book_info_poro.books[0][:title]).to eq("Denver, Co")
    expect(book_info_poro.books[0][:publisher].class).to eq(Array)
    expect(book_info_poro.books[0][:publisher][0]).to eq("Universal Map Enterprises")
  end
end
