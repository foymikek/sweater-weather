require 'rails_helper'

RSpec.describe "forecast API" do
  describe "search by location" do
    it "can search for forecast by 'denver, co'.", :vcr do
      location = 'denver, co'
      get "/api/v1/forecast?location=#{location}"

      expect(response.status).to eq(200)
      
      data     = JSON.parse(response.body, symbolize_names: true)
      expect(data).to be_a(Hash)
      expect(data).to have_key :data
      
      expect(data[:data]).to have_key :id
      expect(data[:data][:id]).to eq(nil)
      
      expect(data[:data]).to have_key :type
      expect(data[:data][:type]).to be_a(String)
      
      expect(data[:data]).to have_key :attributes
      expect(data[:data][:attributes]).to be_a(Hash)

      expect(data[:data][:attributes]).to have_key :current_weather
      expect(data[:data][:attributes][:current_weather]).to have_key :datetime
      expect(data[:data][:attributes][:current_weather][:datetime]).to be_a(String)

      expect(data[:data][:attributes][:current_weather]).to have_key :sunrise
      expect(data[:data][:attributes][:current_weather][:sunrise]).to be_a(String)

      expect(data[:data][:attributes][:current_weather]).to have_key :sunset
      expect(data[:data][:attributes][:current_weather][:sunset]).to be_a(String)

      expect(data[:data][:attributes][:current_weather]).to have_key :temperature
      expect(data[:data][:attributes][:current_weather][:temperature]).to be_a(Numeric)

      expect(data[:data][:attributes][:current_weather]).to have_key :feels_like
      expect(data[:data][:attributes][:current_weather][:feels_like]).to be_a(Numeric)

      expect(data[:data][:attributes][:current_weather]).to have_key :humidity
      expect(data[:data][:attributes][:current_weather][:humidity]).to be_a(Numeric)
      
      expect(data[:data][:attributes][:current_weather]).to have_key :uvi
      expect(data[:data][:attributes][:current_weather][:uvi]).to be_a(Numeric)
      
      expect(data[:data][:attributes][:current_weather]).to have_key :visibility
      expect(data[:data][:attributes][:current_weather][:visibility]).to be_a(Numeric)
      
      expect(data[:data][:attributes][:current_weather]).to have_key :conditions
      expect(data[:data][:attributes][:current_weather][:conditions]).to be_a(String)
      
      expect(data[:data][:attributes][:current_weather]).to have_key :icon
      expect(data[:data][:attributes][:current_weather][:icon]).to be_a(String)

      expect(data[:data][:attributes]).to have_key :daily_weather
      expect(data[:data][:attributes][:daily_weather]).to be_an(Array)
      expect(data[:data][:attributes][:daily_weather].count).to eq(5)

      expect(data[:data][:attributes][:daily_weather][0]).to be_a(Hash)
      expect(data[:data][:attributes][:daily_weather][0]).to have_key :date
      expect(data[:data][:attributes][:daily_weather][0][:date]).to be_a(String)
      
      expect(data[:data][:attributes][:daily_weather][0]).to have_key :sunrise
      expect(data[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(String)

      expect(data[:data][:attributes][:daily_weather][0]).to have_key :sunset
      expect(data[:data][:attributes][:daily_weather][0][:sunset]).to be_a(String)
      
      expect(data[:data][:attributes][:daily_weather][0]).to have_key :max_temp
      expect(data[:data][:attributes][:daily_weather][0][:max_temp]).to be_a(Numeric)
      
      expect(data[:data][:attributes][:daily_weather][0]).to have_key :min_temp
      expect(data[:data][:attributes][:daily_weather][0][:min_temp]).to be_a(Numeric)

      expect(data[:data][:attributes][:daily_weather][0]).to have_key :conditions
      expect(data[:data][:attributes][:daily_weather][0][:conditions]).to be_a(String)


      expect(data[:data][:attributes][:daily_weather][0]).to have_key :icon
      expect(data[:data][:attributes][:daily_weather][0][:icon]).to be_a(String)
      
      expect(data[:data][:attributes]).to have_key :hourly_weather
      expect(data[:data][:attributes][:hourly_weather]).to be_an(Array)
      expect(data[:data][:attributes][:hourly_weather].count).to eq(8)
      expect(data[:data][:attributes][:hourly_weather][0]).to be_an(Hash)
      
      expect(data[:data][:attributes][:hourly_weather][0]).to have_key :time
      expect(data[:data][:attributes][:hourly_weather][0][:time]).to be_a(String)

      
      expect(data[:data][:attributes][:hourly_weather][0]).to have_key :temperature
      expect(data[:data][:attributes][:hourly_weather][0][:temperature]).to be_a(Numeric)

      expect(data[:data][:attributes][:hourly_weather][0]).to have_key :conditions
      expect(data[:data][:attributes][:hourly_weather][0][:conditions]).to be_a(String)
      
      expect(data[:data][:attributes][:hourly_weather][0]).to have_key :icon
      expect(data[:data][:attributes][:hourly_weather][0][:icon]).to be_a(String)
    end
  end
end