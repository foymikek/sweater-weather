class BookWeather
  attr_reader :summary,
              :temperature

  def initialize(data)
    @summary = data[:current][:weather][0][:description]
    @temperature = temp_attribute(data)
  end

  def temp_attribute(data)
    "#{data[:current][:temp]} F"
  end
end