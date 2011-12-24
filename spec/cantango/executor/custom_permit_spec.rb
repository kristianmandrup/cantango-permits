require 'spec_helper'
require 'fixtures/models'

class MembershipPermit < CanTango::Permit::Attribute
  class Builder < CanTango::Permit::Attribute::Builder
    attribute :membership
  end

  def self.inherited(base_clazz)
    register base_clazz, :name => attribute_name(base_clazz)
  end

  # attribute :membership
end

class CanTango::Ability::Base
  def subject
    candidate
  end

  def user
    subject
  end
end

class AdminMembershipPermit < MembershipPermit
  protected

  def calc_rules
    can :read, Article
  end
end

class Admin
  def memberships
    [:admin]
  end
end

describe 'Custom Permit registration - Membership' do
  it 'should register :membership as available permit' do
    CanTango.config.permits.registered_for(:membership, :admin).should == AdminMembershipPermit
  end

  it 'should register :membership as available permit type' do
    CanTango.config.permits.types.available.should include(:membership)
  end
  
  before do
    @user     = Admin.new 'kris', 'kris@mail.ru'
    @ability  = CanTango::Ability::Base.new @user
    @permit   = AdminMembershipPermit.new @ability
    @executor = CanTango::Executor::Permit::Base.new @permit
  end

  describe '#execute!' do
    describe 'should define read Article rule' do
      specify do
        @executor.execute!
        @executor.permit.rules.should_not be_empty
      end
    end
  end  
end

