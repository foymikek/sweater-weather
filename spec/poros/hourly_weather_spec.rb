require 'rails_helper'

RSpec.describe 'HourlyWeather object' do
  it 'abstracts and encapsulates HourlyWeather data that can be read' do
    hourly_weather_obj = HourlyWeather.new(hourly_weather_poro_input)

    expect(hourly_weather_obj).to be_a(HourlyWeather)
    expect(hourly_weather_obj.time).to eq("06/13/2021 at 12:00PM")
    expect(hourly_weather_obj.temperature).to eq(88.43)
    expect(hourly_weather_obj.conditions).to eq("clear sky")
    expect(hourly_weather_obj.icon).to eq("01d")
  end
end
