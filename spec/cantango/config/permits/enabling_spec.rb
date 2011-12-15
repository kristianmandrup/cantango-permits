require 'spec_helper'

class Enabling
  include Singleton
  
  include CanTango::Config::Permits::Enabling
end

describe CanTango::Config::Permits::Enabling do
  subject { Enabling.new }

  describe 'enabled_all_for' do
    pending
  end
  
  describe 'enable_all!' do
    pending
  end
end