require 'rails_helper'

RSpec.describe 'CurrentWeather object' do
  it 'abstracts and encapsulates CurrentWeather data that can be read' do
    daily_weather_obj = DailyWeather.new(daily_weather_poro_input)

    expect(daily_weather_obj).to be_a(DailyWeather)
    expect(daily_weather_obj.date).to eq("06/13/2021 at 01:00PM")
    expect(daily_weather_obj.sunrise).to eq("06/13/2021 at 05:31AM")
    expect(daily_weather_obj.sunset).to eq("06/13/2021 at 08:28PM")
    expect(daily_weather_obj.max_temp).to eq(93.36)
    expect(daily_weather_obj.min_temp).to eq(67.41)
    expect(daily_weather_obj.conditions).to eq("clear sky")
    expect(daily_weather_obj.icon).to eq("01d")
  end
end
