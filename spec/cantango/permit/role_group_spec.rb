require 'rspec'
require 'cantango'
require 'fixtures/models'

class AdminsRoleGroupPermit < CanTango::Permit::RoleGroup
  def initialize ability
    super
  end

  protected

  def calc_rules
  end
end

describe CanTango::Permit::RoleGroup do
  before do
    @user = SimpleUser.new
    @ability = CanTango::Ability::Base.new @user
    @permit = AdminsRoleGroupPermit.new @ability
  end

  describe 'attributes' do
    it "should be the permit for the :admins group" do
      permit.role_group.should == :admins
    end

    it "should have an ability" do
      permit.ability.should be_a(CanTango::Ability)
    end
  end
end
