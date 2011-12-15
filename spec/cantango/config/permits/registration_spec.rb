require 'spec_helper'

class Registration
  include Singleton
  
  include CanTango::Config::Permits::Registration
end

describe CanTango::Config::Permits::Registration do
  subject { Registration.new }
  
  describe '' do
    pending
  end
end