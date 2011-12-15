require 'spec_helper'
require 'fixtures/models'

class MyOwnPermit
  include CanTango::Permit::Helper::Naming
  extend CanTango::Permit::Helper::Naming
end

class CanTango::Permit::Mine
  include CanTango::Permit::Helper::Naming
  extend CanTango::Permit::Helper::Naming
end

module AdminPermits
  class MyOwnPermit
    include CanTango::Permit::Helper::Naming
    extend CanTango::Permit::Helper::Naming    
  end
end

describe CanTango::Permit::Helper::Naming do
  subject { MyOwnPermit.new }
  describe '#permit_name' do
    describe 'permit_name clazz' do
      specify { subject.permit_name(MyOwnPermit).should == :my_own }    
    end

    describe 'permit_name clazz' do
      specify { CanTango::Permit::Mine.permit_name.should == :mine }    
    end

    describe 'clazz.permit_name' do
      specify { MyOwnPermit.permit_name.should == :my_own }    
    end
  end
  
  describe '#account_name' do   
    describe 'account_name clazz' do 
      specify { subject.account_name(MyOwnPermit).should == nil }
    end

    describe 'account_name clazz' do 
      specify { MyOwnPermit.account_name.should == nil }
    end

    describe 'account_name clazz' do 
      specify { CanTango::Permit::Mine.account_name.should == nil }
    end
    
    context 'wrapped in valid account namespace' do
      describe 'account_name clazz' do 
        specify { AdminPermits::MyOwnPermit.account_name.should == :admin }
      end
    end
  end
end
