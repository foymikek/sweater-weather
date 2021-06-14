require 'rails_helper'

RSpec.describe "openbook API" do
  describe "search by location and quantity" do
    it "can search fopenbook by 'denver, co' and quantity 5", :vcr do
      location = 'denver, co'
      quantity = 5
      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

      expect(response.status).to eq(200)
      
      data     = JSON.parse(response.body, symbolize_names: true)
      expect(data).to be_a(Hash)
    end
  end
end
