require 'rails_helper'

RSpec.describe 'BookSearch object' do
  it 'abstracts and encapsulates BookSearch data that can be read' do
    location = 'denver, co'
    book_weather_poro = BookWeather.new(book_weather_poro_input)
    book_info_poro = BookInfo.new(book_info_poro_input)

    book_search_poro = BookSearch.new(location, book_weather_poro, book_info_poro)

    expect(book_search_poro).to be_a(BookSearch)
    expect(book_search_poro.id).to eq(nil)
    expect(book_search_poro.destination).to eq("denver, co")
    expect(book_search_poro.forecast.class).to eq(BookWeather)
    expect(book_search_poro.forecast.summary).to eq("clear sky")
    expect(book_search_poro.forecast.temperature).to eq("87.01 F")
    expect(book_search_poro.total_books_found).to eq(606)
    expect(book_search_poro.books.count).to eq(5)
    expect(book_search_poro.books[0].class).to eq(Hash)
    expect(book_search_poro.books[0][:isbn][0]).to eq("9780762507849")
    expect(book_search_poro.books[0][:isbn][1]).to eq("0762507845")
    expect(book_search_poro.books[0][:title]).to eq("Denver, Co")
    expect(book_search_poro.books[0][:publisher][0]).to eq("Universal Map Enterprises")
  end
end
