class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
    @time        = time_attribute(data[:dt])
    @temperature = data[:temp]
    @conditions  = data[:weather][0][:description]
    @icon        = data[:weather][0][:icon]
  end

  def time_attribute(raw_time)
    Time.at(raw_time)
    .strftime("%m/%d/%Y at %I:%M%p")
  end

end