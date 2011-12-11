require 'spec_helper'

class Execution
  include Singleton
  
  include CanTango::Configuration::Permits::Execution
end

describe CanTango::Configuration::Permits::Execution do
  subject { Execution.new }
  
  describe 'was_executed(permit, ability)' do
    pending
  end

  describe 'executed_for(ability)' do
    pending
  end

  describe 'executed' do
    pending
  end

  describe 'clear_executed!' do
    pending
  end
end