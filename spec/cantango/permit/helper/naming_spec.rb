require 'spec_helper'
require 'fixtures/models'

class MyOwnPermit
  include CanTango::Permit::Helper::Naming
end

describe CanTango::Permit::Helper::Naming do
  subject { MyOwnPermit.new }

  describe 'permit_name clazz' do
    specify { subject.permit_name(MyOwnPermit).should == :my_own }
    
  end

  describe 'account_name clazz' do 
    specify { subject.account_name(MyOwnPermit).should == nil }
  end
end
