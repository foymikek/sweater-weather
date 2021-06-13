require 'rails_helper'

RSpec.describe 'LatNLng object' do
  it 'abstracts and encapsulates LatNLng data that can be read' do
    lat_n_lng_obj = LatNLng.new(lat_n_lng_poro_input)

    expect(lat_n_lng_obj).to be_a(LatNLng)
    expect(lat_n_lng_obj.lat).to eq(39.738453)
    expect(lat_n_lng_obj.lng).to eq(-104.984853)
  end
end
