require 'rails_helper'

RSpec.describe 'CurrentWeather object' do
  it 'abstracts and encapsulates CurrentWeather data that can be read' do
    current_weather_obj = CurrentWeather.new(current_weather_poro_input)

    expect(current_weather_obj).to be_a(CurrentWeather)
    expect(current_weather_obj.conditions).to eq("clear sky")
    expect(current_weather_obj.datetime).to eq("06/13/2021 at 12:41PM")
    expect(current_weather_obj.feels_like).to eq(87.28)
    expect(current_weather_obj.humidity).to eq(36)
    expect(current_weather_obj.icon).to eq("01d")
    expect(current_weather_obj.sunrise).to eq("06/13/2021 at 05:31AM")
    expect(current_weather_obj.sunset).to eq("06/13/2021 at 08:28PM")
    expect(current_weather_obj.temperature).to eq(88.3)
    expect(current_weather_obj.uvi).to eq(11.86)
    expect(current_weather_obj.visibility).to eq(10000)
  end
end
