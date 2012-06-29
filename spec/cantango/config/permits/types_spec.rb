require 'spec_helper'

class Types < CanTango::Config::Permits::Types
  include Singleton
  
end

describe CanTango::Config::Permits::Types do
  subject { Types.new }
  
  describe 'available' do
    pending
  end

  describe 'enabled' do
    pending
  end

  describe 'disable *types' do
    pending
  end

  describe 'enable_all!' do
    pending
  end
end