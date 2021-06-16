# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('weather_api_key') { ENV['weather_api_key'] }
  config.filter_sensitive_data('map_api_key') { ENV['map_api_key'] }
  # config.default_cassette_options = {re_record_interval: 7.days}
  # config.allow_http_connections_when_no_cassette = true
  config.configure_rspec_metadata!
end

def trip_data
  {
    :hasTollRoad=>false,
    :hasBridge=>true,
    :boundingBox=>{:lr=>{:lng=>-104.98484, :lat=>38.521}, :ul=>{:lng=>-106.92691, :lat=>39.738453}},
    :distance=>198.425,
    :hasTimedRestriction=>false,
    :hasTunnel=>false,
    :hasHighway=>true,
    :index=>0,
    :formattedTime=>"03:38:50"
  }
end

def weather_data
  {
    :dt=>1623826800,
    :temp=>71.85,
    :feels_like=>70.48,
    :pressure=>1019,
    :humidity=>37,
    :dew_point=>44.2,
    :uvi=>0,
    :clouds=>41,
    :visibility=>10000,
    :wind_speed=>12.3,
    :wind_deg=>296,
    :wind_gust=>15.95,
    :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03n"}],
    :pop=>0
  }
end

def daily_weather_poro_input
  {
    :dt=>1623610800,
    :sunrise=>1623583887,
    :sunset=>1623637732,
    :moonrise=>1623593160,
    :moonset=>1623648480,
    :moon_phase=>0.1,
    :temp=>{:day=>88.3, :min=>67.41, :max=>93.36, :night=>77.58, :eve=>90.95, :morn=>69.75},
    :feels_like=>{:day=>87.28, :night=>76.96, :eve=>87.24, :morn=>68.45},
    :pressure=>1009,
    :humidity=>36,
    :dew_point=>57.99,
    :wind_speed=>15.77,
    :wind_deg=>151,
    :wind_gust=>22.73,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :clouds=>0,
    :pop=>0.2,
    :uvi=>11.86
  }
end

def hourly_weather_poro_input
  {
    :dt=>1623607200,
    :temp=>88.43,
    :feels_like=>86.76,
    :pressure=>1010,
    :humidity=>33,
    :dew_point=>55.69,
    :uvi=>10.97,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>6.55,
    :wind_deg=>103,
    :wind_gust=>8.46,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0
  }
end

def current_weather_poro_input
  {
    :dt=>1623609672,
    :sunrise=>1623583887,
    :sunset=>1623637732,
    :temp=>88.3,
    :feels_like=>87.28,
    :pressure=>1009,
    :humidity=>36,
    :dew_point=>57.99,
    :uvi=>11.86,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>1.01,
    :wind_deg=>126,
    :wind_gust=>5.99,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]
  }
end

def lat_n_lng_poro_input
  {
    :info=>{:statuscode=>0, :copyright=>{:text=>"© 2021 MapQuest, Inc.", :imageUrl=>"http://api.mqcdn.com/res/mqlogo.gif", :imageAltText=>"© 2021 MapQuest, Inc."}, :messages=>[]},
 :options=>{:maxResults=>-1, :thumbMaps=>true, :ignoreLatLngInput=>false},
 :results=>
  [{:providedLocation=>{:location=>"denver, co"},
    :locations=>
     [{:street=>"",
       :adminArea6=>"",
       :adminArea6Type=>"Neighborhood",
       :adminArea5=>"Denver",
       :adminArea5Type=>"City",
       :adminArea4=>"Denver County",
       :adminArea4Type=>"County",
       :adminArea3=>"CO",
       :adminArea3Type=>"State",
       :adminArea1=>"US",
       :adminArea1Type=>"Country",
       :postalCode=>"",
       :geocodeQualityCode=>"A5XAX",
       :geocodeQuality=>"CITY",
       :dragPoint=>false,
       :sideOfStreet=>"N",
       :linkId=>"282041090",
       :unknownInput=>"",
       :type=>"s",
       :latLng=>{:lat=>39.738453, :lng=>-104.984853},
       :displayLatLng=>{:lat=>39.738453, :lng=>-104.984853},
       :mapUrl=>"http://www.mapquestapi.com/staticmap/v5/map?key=XKrd3r5KBbA81mysYlkh1yrvF8lSSSN4&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-1&scalebar=true&zoom=12&rand=804248488"},
      {:street=>"",
       :adminArea6=>"",
       :adminArea6Type=>"Neighborhood",
       :adminArea5=>"",
       :adminArea5Type=>"City",
       :adminArea4=>"Denver County",
       :adminArea4Type=>"County",
       :adminArea3=>"CO",
       :adminArea3Type=>"State",
       :adminArea1=>"US",
       :adminArea1Type=>"Country",
       :postalCode=>"",
       :geocodeQualityCode=>"A4XAX",
       :geocodeQuality=>"COUNTY",
       :dragPoint=>false,
       :sideOfStreet=>"N",
       :linkId=>"282932003",
       :unknownInput=>"",
       :type=>"s",
       :latLng=>{:lat=>39.738453, :lng=>-104.984853},
       :displayLatLng=>{:lat=>39.738453, :lng=>-104.984853},
       :mapUrl=>"http://www.mapquestapi.com/staticmap/v5/map?key=XKrd3r5KBbA81mysYlkh1yrvF8lSSSN4&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-2&scalebar=true&zoom=9&rand=1607899640"}]}]
  }
end
