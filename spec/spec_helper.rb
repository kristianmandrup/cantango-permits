require 'rspec'
require 'require_all'

require 'cantango/core'
require 'cantango/config'
require 'cantango/api'
require 'cantango/permits'
require 'cutter'

# require_all File.join("#{File.dirname(__FILE__)}", "support")

def fixtures_path
  File.join("#{File.dirname(__FILE__)}", "fixtures")
end

def config_path
  File.join(fixtures_path, 'config')
end

require_all fixtures_path

RSpec.configure do |config|
  
end
