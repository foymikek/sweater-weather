require 'rails_helper'

RSpec.describe 'Weather object' do
  it 'abstracts and encapsulates Weather data that can be read' do
    current_weather_input = CurrentWeather.new(current_weather_poro_input)

    daily_weather_input   = []
    5.times do
      daily_weather_input << DailyWeather.new(daily_weather_poro_input)
    end

    hourly_weather_input  = []
    8.times do
      hourly_weather_input << HourlyWeather.new(hourly_weather_poro_input)
    end
    
    weather_obj = Weather.new(
      current_weather_input,
      daily_weather_input,
      hourly_weather_input
    )

    expect(weather_obj).to be_a(Weather)
    expect(weather_obj.id).to eq(nil)
    expect(weather_obj.current_weather.class).to eq(CurrentWeather)
    expect(weather_obj.daily_weather.class).to eq(Array)
    expect(weather_obj.daily_weather[0].class).to eq(DailyWeather)
    expect(weather_obj.daily_weather.count).to eq(5)
    expect(weather_obj.hourly_weather.class).to eq(Array)
    expect(weather_obj.hourly_weather[0].class).to eq(HourlyWeather)
    expect(weather_obj.hourly_weather.count).to eq(8)
  end
end

