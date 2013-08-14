# coding: utf-8

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'mongoid'
require 'ipgeobase'


# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Mongoid.configure do |config|
  ENV["MONGOID_ENV"] = "test"
  Mongoid.load!("spec/support/mongoid.yml")
end

require File.dirname(__FILE__) + '/../app/models/ipgeobase/city.rb'
require File.dirname(__FILE__) + '/../app/models/ipgeobase/country.rb'
require File.dirname(__FILE__) + '/../app/models/ipgeobase/ip.rb'

Ipgeobase::City.create_indexes
Ipgeobase::Ip.create_indexes

require 'rake'
app = Rake.application
app.init
# do this as many times as needed
# app.add_import 'lib/ipgeobase/tasks.rake'
# this loads the Rakefile and other imports
app.load_rakefile
app["ipgeobase:cities"].execute
moscow_id1 = Ipgeobase::City.where(city: 'Москва').first.id

app["ipgeobase:cities"].execute
moscow_id2 = Ipgeobase::City.where(city: 'Москва').first.id
# check that city ids are not changed on reimport
raise 'city id changed' if moscow_id1 != moscow_id2

app["ipgeobase:ips"].execute

RSpec.configure do |config|
  config.mock_with :rspec
end