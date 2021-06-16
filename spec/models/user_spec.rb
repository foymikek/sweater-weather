require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :api_key}
    it {should validate_presence_of :password}
  end

  describe 'instance method' do 
    it 'can create an api key' do 
      User.destroy_all
      user = User.new(
        email: 'test123@example.com',
        password: 'password123'
      )
      expect(user.create_key).to be_a(String)
    end
  end
end