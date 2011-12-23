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

  def self.membership_name clazz
    clazz.name.demodulize.gsub(/(.*)(MembershipPermit)/, '\1').underscore.to_sym
  end

  def self.hash_key
    :memberships
  end

  def permit_name
    self.class.membership_name self.class
  end
  alias_method :membership_name, :permit_name

  # creates the permit
  # @param [Permits::Ability] the ability
  # @param [Hash] the options
  def initialize ability
    super
  end

  def permit?
    super
  end

  def valid_for? subject
    subject.memberships.include? membership_name
  end
end

class AdminMembershipPermit < MembershipPermit
end

describe 'Custom Permit registration - Membership' do
  it 'should register :membership as available permit' do
    CanTango.config.permits.registered_for(:membership, :admin).should == AdminMembershipPermit
  end

  it 'should register :membership as available permit type' do
    CanTango.config.permits.types.available.should include(:membership)
  end
end

