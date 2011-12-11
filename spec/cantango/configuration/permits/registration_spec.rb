require 'spec_helper'

class Registration
  include Singleton
  
  include CanTango::Configuration::Permits::Registration
end

describe CanTango::Configuration::Permits::Registration do
  subject { Registration.new }
  
  describe '' do
    pending
  end
end