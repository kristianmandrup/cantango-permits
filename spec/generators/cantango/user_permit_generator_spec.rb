require 'spec_helper'
require 'generator-spec'

require_generator :cantango => :user_permit

RSpec::Generator.configure do |config|
  config.debug = true
  config.remove_temp_dir = true #false
  config.default_rails_root(__FILE__)
  config.lib = File.dirname(__FILE__) + '/../lib'
  config.logger = :stdout  # :file
end


describe Cantango::Generators::UserPermitGenerator  do
  use_helpers :special, :file

  setup_generator :user_permit do
    tests CanTango::Generators::UserPermitGenerator
  end

  describe "User Permit: Admin" do
    before :each do
      @generator = with_generator do |g|
        g.run_generator "admin --read all --licenses blogging".args
      end
    end

    it "should have created user permit file" do
      # @generator.should have_permit_file :user_type, :admin
    end
  end
end
