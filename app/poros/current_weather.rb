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
    @datetime    = datetime_attribute(data[:dt])
    @sunrise     = sunrise_attribute(data[:sunrise])
    @sunset      = sunset_attribute(data[:sunset])
    @temperature = data[:temp]
    @feels_like  = data[:feels_like]
    @humidity    = data[:humidity]
    @uvi         = data[:uvi]
    @visibility  = data[:visibility]
    @conditions  = data[:weather][0][:description]
    @icon        = data[:weather][0][:icon]
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