require 'rails_helper'

RSpec.describe 'FlickrService' do
  it 'can return json', :vcr do
   json = FlickrService.get_image_id_db('denver, co')

   expect(json).to be_a(Hash)
   expect(json).to have_key :photos
   expect(json[:photos]).to have_key :photo
   expect(json[:photos][:photo]).to be_an(Array)
   expect(json[:photos][:photo][0]).to have_key :id
   expect(json[:photos][:photo][0][:id]).to be_a(String)
  end
end