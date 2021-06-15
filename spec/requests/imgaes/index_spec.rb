require 'rails_helper'

RSpec.describe "imgaes API" do
  describe "search by location" do
    it "can search for images by 'denver'.", :vcr do
      get '/api/v1/backgrounds?location=denver'
      expect(response).to be_successful
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data).to have_key :data

      expect(data).to have_key :data
      expect(data[:data]).to be_a(Hash)

      expect(data[:data]).to have_key :attributes
      expect(data[:data][:attributes]).to be_a(Hash)
      expect(data[:data][:attributes]).to have_key :image
      expect(data[:data][:attributes][:image]).to be_a(Hash)

      expect(data[:data][:attributes][:image]).to have_key :location
      expect(data[:data][:attributes][:image][:location]).to be_a(String)

      expect(data[:data][:attributes][:image]).to have_key :image_url
      expect(data[:data][:attributes][:image][:image_url]).to be_a(String)

      expect(data[:data][:attributes][:image]).to have_key :credit
      expect(data[:data][:attributes][:image][:credit]).to be_a(Hash)

      expect(data[:data][:attributes][:image][:credit]).to have_key :source
      expect(data[:data][:attributes][:image][:credit][:source]).to be_a(String)

      expect(data[:data][:attributes][:image][:credit]).to have_key :author
      expect(data[:data][:attributes][:image][:credit][:author]).to be_a(String)
    end
  end
end