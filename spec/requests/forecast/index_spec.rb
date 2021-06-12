require 'rails_helper'

RSpec.describe "forecast API" do
  describe "search by location" do
    it "can search for forecast by 'denver, co'.", :vcr do
      get '/api/v1/forecast'
    end
  end
end