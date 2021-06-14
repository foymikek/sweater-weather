require 'rails_helper'

RSpec.describe 'Forecast Facade' do
  it 'can return a LatnLng object', :vcr do
    location = 'denver, co'
    lat_n_lng = ForecastFacade.location_coords(location)
    
    expect(lat_n_lng).to be_an(LatNLng)
    expect(lat_n_lng.lat).to be_a(Numeric)
    expect(lat_n_lng.lng).to be_a(Numeric)
  end
  
  it "can return a Weather object", :vcr do
    location = 'denver, co'
    weather_obj = ForecastFacade.forecast_query(location)

    expect(weather_obj).to be_a(Weather)

    expect(weather_obj.current_weather).to be_a(CurrentWeather)
    expect(weather_obj.current_weather.conditions).to be_a(String)
    expect(weather_obj.current_weather.datetime).to be_a(String)
    expect(weather_obj.current_weather.feels_like).to be_a(Numeric)
    expect(weather_obj.current_weather.humidity).to be_a(Numeric)
    expect(weather_obj.current_weather.icon).to be_a(String)
    expect(weather_obj.current_weather.sunrise).to be_a(String)
    expect(weather_obj.current_weather.sunset).to be_a(String)
    expect(weather_obj.current_weather.temperature).to be_a(Numeric)
    expect(weather_obj.current_weather.uvi).to be_a(Numeric)
    expect(weather_obj.current_weather.visibility).to be_a(Numeric)
    
    expect(weather_obj.daily_weather).to be_an(Array)
    expect(weather_obj.daily_weather.count).to eq(5)
    
    weather_obj.daily_weather.each do |daily_weather_obj|
      expect(daily_weather_obj).to be_a(DailyWeather)
      expect(daily_weather_obj.conditions).to be_a(String)
      expect(daily_weather_obj.date).to be_a(String)
      expect(daily_weather_obj.icon).to be_a(String)
      expect(daily_weather_obj.max_temp).to be_a(Numeric)
      expect(daily_weather_obj.min_temp).to be_a(Numeric)
      expect(daily_weather_obj.sunrise).to be_a(String)
      expect(daily_weather_obj.sunset).to be_a(String)
    end
    
    expect(weather_obj.hourly_weather).to be_an(Array)
    expect(weather_obj.hourly_weather.count).to eq(8)
    
    weather_obj.hourly_weather.each do |hourly_weather_obj|
      expect(hourly_weather_obj).to be_a(HourlyWeather)
      expect(hourly_weather_obj.conditions).to be_a(String)
      expect(hourly_weather_obj.icon).to be_a(String)
      expect(hourly_weather_obj.temperature).to be_a(Numeric)
      expect(hourly_weather_obj.time).to be_a(String)
    end
  end

  it "can return a BookSearch obj" do
    location = 'denver, co'
    book_search_poro = ForecastFacade.book_forecast_query(location)

    expect(book_search_poro).to be_a(BookSearch)
    expect(book_search_poro.books).to be_an(Array)
    expect(book_search_poro.books[0]).to be_a(Hash)
    expect(book_search_poro.books[0]).to have_key :isbn
    expect(book_search_poro.books[0][:isbn]).to be_an(Array)
    expect(book_search_poro.books[0][:isbn][0]).to be_a(String)
    expect(book_search_poro.books[0]).to have_key :title
    expect(book_search_poro.books[0][:title]).to be_a(String)
    expect(book_search_poro.books[0]).to have_key :publisher
    expect(book_search_poro.books[0][:publisher]).to be_an(Array)
    expect(book_search_poro.books[0][:publisher][0]).to be_a(String)
  end
end
