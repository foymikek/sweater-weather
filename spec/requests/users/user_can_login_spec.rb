require 'rails_helper'

RSpec.describe "Users" do
  describe "user endpoints" do 
    it "can return user info upon login" do
      user = User.new(
        email: 'test123@example.com',
        password: 'password123'
      )
      user.create_key
      user.save

      query_params = {
          "email": "test123@example.com",
          "password": "password123",
                      }
      post "/api/v1/sessions", params: query_params
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
      
      session_response = JSON.parse(response.body, symbolize_names: true)
      expect(session_response).to be_a(Hash)
      expect(session_response).to have_key(:data)
      expect(session_response[:data]).to be_a(Hash)
      expect(session_response[:data]).to have_key(:id)
      expect(session_response[:data][:id]).to be_a(String)
      expect(session_response[:data]).to have_key(:type)
      expect(session_response[:data][:type]).to eq('users')
      expect(session_response[:data]).to have_key(:attributes)
      expect(session_response[:data][:attributes]).to be_a(Hash)
      expect(session_response[:data][:attributes]).to have_key(:email)
      expect(session_response[:data][:attributes][:email]).to be_a(String)
      expect(session_response[:data][:attributes]).to have_key(:api_key)
      expect(session_response[:data][:attributes][:api_key]).to be_a(String)
    end

    it "returns 401 with invalid credentials" do
      User.destroy_all
      user = User.new(
        email: 'test123@example.com',
        password: 'password123'
      )
      user.create_key
      user.save
      
      query_params = {
          "email": "test123@example.com",
          "password": "test_password_blah_blah",
          "password_confirmation": "test_password"
                      }
      post "/api/v1/users", params: query_params
      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
  end
end