class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date        = Time.at(data[:dt]).strftime("%m/%d/%Y at %I:%M%p")
    @sunrise     = Time.at(data[:sunrise]).strftime("%m/%d/%Y at %I:%M%p")
    @sunset      = Time.at(data[:sunset]).strftime("%m/%d/%Y at %I:%M%p")
    @max_temp    = data[:temp][:max]
    @min_temp    = data[:temp][:min]
    @conditions  = data[:weather][0][:description]
    @icon        = data[:weather][0][:icon]
  end
end