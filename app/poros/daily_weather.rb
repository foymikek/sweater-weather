class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date        = date_attribute(data[:dt])
    @sunrise     = sunrise_attribute(data[:sunrise])
    @sunset      = sunset_attribute(data[:sunset])
    @max_temp    = data[:temp][:max]
    @min_temp    = data[:temp][:min]
    @conditions  = data[:weather][0][:description]
    @icon        = data[:weather][0][:icon]
  end

  def date_attribute(raw_time)
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