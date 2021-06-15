require 'rails_helper'

RSpec.describe 'Flickr Facade' do
  it 'can return a Image obj', :vcr do
    image = FlickrFacade.get_image('denver, co')

    expect(image.class).to eq(Image)
    expect(image.image.class).to eq(Hash)
    expect(image.image[:location].class).to eq(String)
    expect(image.image[:image_url].class).to eq(String)
    expect(image.image[:credit].class).to eq(Hash)
    expect(image.image[:credit][:source].class).to eq(String)
    expect(image.image[:credit][:author].class).to eq(String)
  end
end