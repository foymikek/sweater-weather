require 'rails_helper'

RSpec.describe 'MapQuestService' do
  it 'location_coords_db: can return json', :vcr do
    location = "denver, co"

    json = MapQuestService.location_coords_db(location)
    expect(json).to be_a(Hash)
    expect(json).to have_key :results

    expect(json[:results]).to be_an(Array)
    expect(json[:results][0]).to be_a(Hash)
    expect(json[:results][0]).to have_key :locations

    expect(json[:results][0][:locations]).to be_an(Array)
    expect(json[:results][0][:locations][0]).to be_a(Hash)
    expect(json[:results][0][:locations][0]).to have_key :latLng
    expect(json[:results][0][:locations][0][:latLng]).to be_a(Hash)
    
    expect(json[:results][0][:locations][0][:latLng]).to have_key :lat
    expect(json[:results][0][:locations][0][:latLng][:lat]).to be_a(Numeric)
    
    expect(json[:results][0][:locations][0][:latLng]).to have_key :lng
    expect(json[:results][0][:locations][0][:latLng][:lng]).to be_a(Numeric)
  end

  it 'trip_duration_db: can return json', :vcr do
    json = MapQuestService.trip_duration_db('Denver,CO', 'Gunnison,CO')
    
    expect(json).to be_a(Hash)
    expect(json).to have_key :formattedTime
    expect(json[:formattedTime]).to be_a(String) 

    expect(json).to have_key :boundingBox
    expect(json[:boundingBox]).to be_a(Hash)
    expect(json[:boundingBox]).to have_key :lr
    
    expect(json[:boundingBox][:lr]).to have_key :lng
    expect(json[:boundingBox][:lr][:lng]).to be_a(Numeric)
    
    expect(json[:boundingBox][:lr]).to have_key :lat
    expect(json[:boundingBox][:lr][:lat]).to be_a(Numeric)

  end
end
