require 'spec_helper'

class Disabling
  include Singleton
  
  include CanTango::Config::Permits::Disabling
end

class CanTango::Permit::Mine < CanTango::Permit::UserType
end

CanTango.config do |c|
  c.permits.register_permit CanTango::Permit::Mine
end

describe CanTango::Config::Permits::Disabling do
  subject { Disabling.new }
  
  describe 'disable_for :type, [name1, name2]' do
    before do
      Disabling.disable_for :user_type, [:mine]
    end
  end

  describe 'disable_for :type => [name1, name2]' do
    before do
      Disabling.disable_for :user_type => [:mine]
    end
  end

  describe 'disabled_for type' do
    pending
  end

  describe 'disabled' do
    pending
  end
end