require 'spec_helper'
require 'fixtures/models'

class MembershipPermit < CanTango::Permit::Base
  class Builder < CanTango::Builder::Permit::Base
    def build
      return [] if !memberships
      super
    end
    
    def memberships
      ability.subject.memberships
    end
  end

  def self.inherited(base_clazz)
    register base_clazz, :name => membership_name(base_clazz)
  end

  def self.type
    :membership
  end

  def self.membership_name clazz = nil
    clazz ||= self
    clazz.name.demodulize.gsub(/(.*)(MembershipPermit)/, '\1').underscore.to_sym
  end

  def self.hash_key
    :memberships
  end

  def permit_name
    self.class.membership_name
  end

  def valid?
    return false unless subject.respond_to? :memberships
    subject.memberships.include? membership_name
  end
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

