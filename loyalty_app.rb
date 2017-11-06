require './lib/swaggering'
require 'mongoid'
require './lib/status'

# only need to extend if you want special configuration!
class LoyaltyApp < Swaggering
  self.configure do |config|
    config.api_version = '1.0.0'
    Mongoid.load!("./config/mongoid.yml")

    Status.new("bronze", 0)
    Status.new("silver", 10)
    Status.new("gold", 25)
    Status.new("platinum", 50)
  end
end

# include the api files
Dir["./api/*.rb"].each        { |file| require file }
# include models
Dir["./lib/models/*.rb"].each { |file| require file }
