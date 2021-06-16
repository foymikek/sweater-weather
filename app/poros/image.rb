class Image
  attr_reader :id,
              :image

  def initialize(data, location)
    @id    = nil
    @image = {
      location: location,
      image_url: data[:photo][:urls][:url][0][:_content],
      credit: {
        source: 'flickr.com',
        author: data[:photo][:owner][:username]
        }
      }
  end
end