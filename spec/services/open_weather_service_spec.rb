require 'rails_helper'

RSpec.describe 'weather service' do
  it 'can return json', :vcr do
    place_id = "Denver"

    json = WeatherService.get_three_day_forecast_db(place_id)

    expect(json).to be_a(Hash)
    expect(json).to have_key :forecast
    expect(json[:forecast]).to be_a(Hash)
    expect(json[:forecast]).to have_key :forecastday
    expect(json[:forecast][:forecastday]).to be_an(Array)
    expect(json[:forecast][:forecastday].first).to be_a(Hash)

    expect(json[:forecast][:forecastday].first).to have_key :astro
    expect(json[:forecast][:forecastday].first[:astro]).to be_a(Hash)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :sunrise
    expect(json[:forecast][:forecastday].first[:astro][:sunrise]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :sunset
    expect(json[:forecast][:forecastday].first[:astro][:sunset]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :moonrise
    expect(json[:forecast][:forecastday].first[:astro][:moonrise]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :moonset
    expect(json[:forecast][:forecastday].first[:astro][:moonset]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :moon_phase
    expect(json[:forecast][:forecastday].first[:astro][:moon_phase]).to be_a(String)
    expect(json[:forecast][:forecastday].first[:astro]).to have_key :moon_illumination
    expect(json[:forecast][:forecastday].first[:astro][:moon_illumination]).to be_a(String)
  end
end
