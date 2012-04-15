require 'spec_helper'
require 'generator-spec'

require_generator :cantango => :account_permit

RSpec::Generator.configure do |config|
  config.debug = true
  config.remove_temp_dir = true #false
  config.default_rails_root(__FILE__)
  config.lib = File.dirname(__FILE__) + '/../lib'
  config.logger = :stdout  # :file
end


describe Cantango::Generators::AccountPermitGenerator  do
  use_helpers :special, :file

  setup_generator :account_permit do
    tests CanTango::Generators::AccountPermitGenerator
  end

  describe "Account Permit: Admin" do
    before :each do
      @generator = with_generator do |g|
        g.run_generator "admin --read all --licenses blogging".args
      end
    end

    it "should have created account permit file" do
      # @generator.should have_permit_file :account_type, :admin
    end
  end
end
