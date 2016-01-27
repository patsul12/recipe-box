ENV['RACK_ENV'] = 'test'

require 'sinatra/activerecord'
require 'rspec'
require 'pg'
require 'recipe'

RSpec.configure do |config|
  config.after(:each) do

  end
end
