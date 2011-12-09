require 'spec_helper'

class Context
  include CanTango::Ability::Helper::Permits
end

describe CanTango::Ability::Helper::Permits do
  subject { Context.new }
  describe 'permits?' do
    specify do
      subject.permits?.should == CanTango.config.permits.on?
    end
  end
end