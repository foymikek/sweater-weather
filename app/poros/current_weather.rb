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
    @datetime    = Time.at(data[:current][:dt]).strftime("%m/%d/%Y at %I:%M%p")
    @sunrise     = Time.at(data[:current][:sunrise]).strftime("%m/%d/%Y at %I:%M%p")
    @sunset      = Time.at(data[:current][:sunset]).strftime("%m/%d/%Y at %I:%M%p")
    @temperature = data[:current][:temp]
    @feels_like  = data[:current][:feels_like]
    @humidity    = data[:current][:humidity]
    @uvi         = data[:current][:uvi]
    @visibility  = data[:current][:visibility]
    @conditions  = data[:current][:weather][0][:description]
    @icon        = data[:current][:weather][0][:icon]
  end
end