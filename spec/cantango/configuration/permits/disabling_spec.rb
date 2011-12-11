require 'spec_helper'

class Disabling
  include Singleton
  
  include CanTango::Configuration::Permits::Disabling
end

describe CanTango::Configuration::Permits::Disabling do
  subject { Disabling.new }
  
  describe 'disable_for type, *names' do
    pending
  end

  describe 'disabled_for type' do
    pending
  end

  describe 'disabled' do
    pending
  end
end