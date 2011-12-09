require 'rspec'
require 'require_all'

require 'cantango/core'
require 'cantango/configuration'
require 'cantango/api'
require 'cantango/permits'
require 'cutter'

# require_all File.join("#{File.dirname(__FILE__)}", "support")
require_all File.join("#{File.dirname(__FILE__)}", "fixtures")

RSpec.configure do |config|
  
end
