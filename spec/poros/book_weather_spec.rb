require 'rails_helper'

RSpec.describe 'BookWeather object' do
  it 'abstracts and encapsulates BookWeather data that can be read' do
    book_weather_poro = BookWeather.new(book_weather_poro_input)
    
    expect(book_weather_poro.class).to eq(BookWeather)
    expect(book_weather_poro.summary).to eq("clear sky")
    expect(book_weather_poro.temperature).to eq("87.01 F")
  end
end
