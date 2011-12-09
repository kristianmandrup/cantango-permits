require 'spec_helper'
require 'fixtures/models'

class AdminPermit < CanTango::Permit::UserType
  def initialize ability
    super
  end

  protected

  def static_rules
    can :read, Article
  end
end


describe CanTango::Permit::UserType do
  before do
    @user = SimpleUser.new
    @ability = CanTango::Ability::Base.new @user
    @permit = AdminPermit.new @ability
  end

  describe 'attributes' do
    it "should be the permit for the :admin user" do
      permit.user_type.should == :admin
      permit.permit_name.should == :admin
    end

    it "should have an ability" do
      permit.ability.should be_a(CanTango::Ability::Base)
    end
  end

  describe 'disable Admin Permit' do
    before do
      CanTango.config.permits.disable_for :user, [:admin, :editor]
    end

    it "should have an ability" do
      permit.disabled?.should be_true
    end
  end

  describe 'enable all Permits' do
    before do
      CanTango.config.permits.enable_all!
    end

    it "should be disabled" do
      CanTango.config.permits.disabled.should be_empty
      permit.disabled?.should be_false
    end
  end
end

