require 'rails_helper'

RSpec.describe "User controller" do
  describe "can process user information" do 
    it "can register user and return user information" do
      query_params = {
          "email": "test@example.com",
          "password": "test_password",
          "password_confirmation": "test_password"
                      }
      post "/api/v1/users", params: query_params
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
      
      user_info = JSON.parse(response.body, symbolize_names: true)
      expect(user_info).to be_a(Hash)
      expect(user_info).to have_key(:data)
      expect(user_info[:data]).to be_a(Hash)

      expect(user_info[:data]).to have_key(:id)
      expect(user_info[:data][:id]).to be_a(String)

      expect(user_info[:data]).to have_key(:type)
      expect(user_info[:data][:type]).to eq('users')

      expect(user_info[:data]).to have_key(:attributes)
      expect(user_info[:data][:attributes]).to be_a(Hash)

      expect(user_info[:data][:attributes]).to have_key(:email)
      expect(user_info[:data][:attributes][:email]).to be_a(String)

      expect(user_info[:data][:attributes]).to have_key(:api_key)
      expect(user_info[:data][:attributes][:api_key]).to be_a(String)
    end
  end
end