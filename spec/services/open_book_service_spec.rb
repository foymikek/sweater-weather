require 'rails_helper'

RSpec.describe 'OPenBookService' do
  it 'can return json'do
   location = 'denver, co'
   json = OpenBookService.books_by_location(location)

   expect(json).to be_a(Hash)
   expect(json).to have_key :num_found
   expect(json[:num_found]).to be_a(Numeric)
   
   expect(json).to have_key :docs
   expect(json[:docs]).to be_an(Array)

   expect(json[:docs][0]).to be_a(Hash)
   expect(json[:docs][0]).to have_key :isbn
   expect(json[:docs][0][:isbn]).to be_an(Array)
   expect(json[:docs][0][:isbn][0]).to be_a(String)
   
   expect(json[:docs][0]).to have_key :title
   expect(json[:docs][0][:title]).to be_a(String)
   
   expect(json[:docs][0]).to have_key :publisher
   expect(json[:docs][0][:publisher]).to be_an(Array)
   expect(json[:docs][0][:publisher][0]).to be_a(String)
  end
end
