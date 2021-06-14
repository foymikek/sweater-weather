require 'rails_helper'

RSpec.describe "openbook API" do
  describe "search by location and quantity" do
    it "can search fopenbook by 'denver, co' and quantity 5", :vcr do
      location = 'denver, co'
      quantity = 5
      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

      # require 'pry'; binding.pry
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
      
      expect(data[:data][:attributes]).to have_key :destination
      expect(data[:data][:attributes][:destination]).to be_a(String)
      
      expect(data[:data][:attributes]).to have_key :forecast
      expect(data[:data][:attributes][:forecast]).to be_a(Hash)
      expect(data[:data][:attributes][:forecast]).to have_key :summary
      expect(data[:data][:attributes][:forecast][:sumary]).to be_a(String)
      expect(data[:data][:attributes][:forecast]).to have_key :temperature
      expect(data[:data][:attributes][:forecast][:temperature]).to be_a(String)
      
      expect(data[:data][:attributes]).to have_key :total_books_found
      expect(data[:data][:attributes][:forecast][:total_books_found]).to be_a(Numeric)

      expect(data[:data][:attributes]).to have_key :books
      expect(data[:data][:attributes][:books]).to be_an(Array)
      expect(data[:data][:attributes][:books].count).to eq(5)
      expect(data[:data][:attributes][:books][0]).to be_a(Hash)
      
      expect(data[:data][:attributes][:books][0]).to have_key :isbn
      expect(data[:data][:attributes][:books][0][:isbn]).to be_an(Array)
      expect(data[:data][:attributes][:books][0][:isbn][0]).to be_a(String)
      
      expect(data[:data][:attributes][:books][0]).to have_key :title
      expect(data[:data][:attributes][:books][0][:title]).to be_a(String)
      
      expect(data[:data][:attributes][:books][0]).to have_key :publisher
      expect(data[:data][:attributes][:books][0][:publisher]).to be_a(String)

    end
  end
end
