require 'spec_helper'
require 'fixtures/models'

class AdminRolePermit < CanTango::Permit::Role
  def initialize ability
    super
  end

  protected

  def static_rules
  end
end


describe CanTango::Permit::Role do
  before do
    @user = SimpleUser.new
    @ability = CanTango::Ability::Base.new @user
    @permit = AdminRolePermit.new @ability
  end

  describe 'attributes' do
    it "should be the permit for the :admin role" do
      permit.role.should == :admin
    end

    it "should have an ability" do
      permit.ability.should be_a(CanTango::Ability)
    end
  end
end
