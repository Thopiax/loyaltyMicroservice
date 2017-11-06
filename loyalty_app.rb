require './lib/swaggering'
require 'mongoid'
require './lib/status'

BRONZE_THRESHOLD = 0
SILVER_THRESHOLD = 10
GOLD_THRESHOLD = 25
PLATINUM_THRESHOLD = 50

# only need to extend if you want special configuration!
class LoyaltyApp < Swaggering
  self.configure do |config|
    config.api_version = '1.0.0'
    Mongoid.load!("./config/mongoid.yml")

    Status.new("bronze", BRONZE_THRESHOLD, 1)
    Status.new("silver", SILVER_THRESHOLD, 3)
    Status.new("gold", GOLD_THRESHOLD, 5)
    Status.new("platinum", PLATINUM_THRESHOLD, 10)
  end
end

# include the api files
Dir["./api/*.rb"].each        { |file| require file }
# include models
Dir["./lib/models/*.rb"].each { |file| require file }
