require 'spec_helper'

class Tracking
  include Singleton
  
  include CanTango::Config::Permits::Tracking
end

describe CanTango::Config::Permits::Tracking do
  subject { Tracking.new }
  
  describe 'allowed(candidate, actions, subjects)' do
    pending
  end

  describe 'denied(candidate, actions, subjects)' do
    pending
  end
end