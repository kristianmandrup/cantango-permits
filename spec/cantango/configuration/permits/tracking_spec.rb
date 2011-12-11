require 'spec_helper'

class Tracking
  include Singleton
  
  include CanTango::Configuration::Permits::Tracking
end

describe CanTango::Configuration::Permits::Tracking do
  subject { Tracking.new }
  
  describe 'allowed(candidate, actions, subjects)' do
    pending
  end

  describe 'denied(candidate, actions, subjects)' do
    pending
  end
end