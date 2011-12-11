require 'spec_helper'

class Enabling
  include Singleton
  
  include CanTango::Configuration::Permits::Enabling
end

describe CanTango::Configuration::Permits::Enabling do
  subject { Enabling.new }

  describe 'enabled_all_for' do
    pending
  end
  
  describe 'enable_all!' do
    pending
  end
end