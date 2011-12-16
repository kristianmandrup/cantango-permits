require 'spec_helper'
require 'fixtures/models'

class MyOwnPermit < CanTango::Permit::UserType
  def initialize ability
    super
  end

  protected

  def calc_rules
    can :read, Article
  end
end

describe CanTango::Permit::ClassMethods do
  subject { MyOwnPermit }

  describe 'inherited(subclass)' do
    it "should be the permit for the :admin account" do
      subject.permit_type.should == :user_type
    end  

    it "should not be an account permit" do
      subject.account_name.should == nil
    end  

    it "should not be an account permit" do
      subject.permit_name.should == :my_own
    end  

    it "should have a finder" do
      subject.finder.should be_a CanTango::Finder::Permit::Base
    end
  end  
end

