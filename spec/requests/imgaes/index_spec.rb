require 'rails_helper'

RSpec.describe "imgaes API" do
  describe "search by location" do
    it "can search for images by 'denver'.", :vcr do
      get '/api/v1/backgrounds?location=denver'
      expect(response).to be_successful
    end
  end
end