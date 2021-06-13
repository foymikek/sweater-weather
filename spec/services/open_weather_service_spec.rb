require 'rails_helper'

RSpec.describe 'OPenWeatherService' do
  it 'can return json', :vcr do
   lat = 39.738453
   lng = -104.984853

   json = OpenWeatherService.forecast_query_db(lat, lng)

   expect(json).to be_a(Hash)
   expect(json).to have_key :current

   expect(json[:current]).to be_a(Hash)
   expect(json[:current]).to have_key :dt
   expect(json[:current][:dt]).to be_a(Numeric)
   
   expect(json[:current]).to have_key :sunrise
   expect(json[:current][:sunrise]).to be_a(Numeric)
   
   expect(json[:current]).to have_key :sunset
   expect(json[:current][:sunset]).to be_a(Numeric)

   expect(json[:current]).to have_key :temp
   expect(json[:current][:temp]).to be_a(Numeric)
   
   expect(json[:current]).to have_key :feels_like
   expect(json[:current][:feels_like]).to be_a(Numeric)
   
   expect(json[:current]).to have_key :humidity
   expect(json[:current][:humidity]).to be_a(Numeric)
   
   expect(json[:current]).to have_key :uvi
   expect(json[:current][:uvi]).to be_a(Numeric)
   
   expect(json[:current]).to have_key :visibility
   expect(json[:current][:visibility]).to be_a(Numeric)

   expect(json[:current]).to have_key :weather
   expect(json[:current][:weather]).to be_an(Array)
   expect(json[:current][:weather][0]).to be_a(Hash)

   expect(json[:current][:weather][0]).to have_key :description
   expect(json[:current][:weather][0][:description]).to be_a(String)

   expect(json[:current][:weather][0]).to have_key :icon
   expect(json[:current][:weather][0][:icon]).to be_a(String)
  end
end
