class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
    @datetime    = datetime_attribute(data[:current][:dt])
    @sunrise     = sunrise_attribute(data[:current][:sunrise])
    @sunset      = sunset_attribute(data[:current][:sunset])
    @temperature = data[:current][:temp]
    @feels_like  = data[:current][:feels_like]
    @humidity    = data[:current][:humidity]
    @uvi         = data[:current][:uvi]
    @visibility  = data[:current][:visibility]
    @conditions  = data[:current][:weather][0][:description]
    @icon        = data[:current][:weather][0][:icon]
  end

  def datetime_attribute(raw_time)
    Time.at(raw_time)
    .strftime("%m/%d/%Y at %I:%M%p")
  end

  def sunrise_attribute(raw_time)
    Time.at(raw_time)
    .strftime("%m/%d/%Y at %I:%M%p")    
  end

  def sunset_attribute(raw_time)
    Time.at(raw_time)
    .strftime("%m/%d/%Y at %I:%M%p")    
  end
end