require 'spec_helper'

class Disabling
  include Singleton
  
  include CanTango::Config::Permits::Disabling
end

CanTango.config do |c|
  c.permits.register_permit
end

describe CanTango::Config::Permits::Disabling do
  subject { Disabling.new }
  
  describe 'disable_for type, *names' do
    before do
      Disabling.disable_for :user_type, [:admin, :editor]
    end
  end

  describe 'disabled_for type' do
    pending
  end

  describe 'disabled' do
    pending
  end
end