require 'spec_helper'
require 'fixtures/models'

class AdminAccountPermit < CanTango::Permit::AccountType
  def initialize ability
    super
  end

  protected

  def static_rules
    can :read, Article
  end
end

describe CanTango::Permit::AccountType do
  before do
    @user = SimpleUser.new
    @ability = CanTango::Ability::Base.new @user
    @permit = AdminAccountPermit.new @ability
  end

  describe 'attributes' do
    it "should be the permit for the :admin account" do
      permit.account_type.should == :admin
    end

    it "should have an ability" do
      permit.ability.should be_a(CanTango::Ability)
    end
  end
end


