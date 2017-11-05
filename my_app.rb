require './lib/swaggering'
require 'mongoid'

# only need to extend if you want special configuration!
class MyApp < Swaggering
  self.configure do |config|
    config.api_version = '1.0.0'
    Mongoid.load!("./config/mongoid.yml")
  end
end

# include the api files
Dir["./api/*.rb"].each { |file|
  require file
}
