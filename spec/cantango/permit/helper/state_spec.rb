require 'spec_helper'

class MyOwnPermit
  include CanTango::Permit::Helper::State
end

describe CanTango::Permit::Helper::Naming do
  subject { MyOwnPermit.new }
  describe '#enable!' do
    before do
      subject.enable!
    end
    specify { subject.enabled?.should be_true }    
    specify { subject.disabled?.should be_false }    
  end

  describe '#disable!' do
    before do
      subject.disable!
    end
    specify { subject.enabled?.should be_false }    
    specify { subject.disabled?.should be_true }    
  end
end