require 'spec_helper'
require 'cantango/configuration/permit_registry_ex'

class Menu
end

class WaiterRolePermit < CanTango::Permit::Role
  def initialize ability
    super
  end

  protected

  def calc_rules
    can :read, Menu
    cannot :write, Menu
  end
end

class ChefRolePermit < CanTango::Permit::Role
  def initialize ability
    super
  end

  protected

  def calc_rules
    can :publish, Menu
    can :write, Menu
  end
end

class Context
  include CanTango::Api::User::Ability
end

describe CanTango::Configuration::Permits do
  subject { CanTango::Configuration::Permits.instance }

  it_should_behave_like CanTango::Configuration::PermitRegistry

  describe 'clear_permits_executed!' do
    specify { CanTango.config.permits.executed.should be_empty }
    
    before do
      CanTango.config.permits.executed[:x] = 1
      subject.clear_permits_executed!
    end
    
    specify { CanTango.config.permits.executed.should be_empty }
  end

  describe 'debugging permits' do
    let(:context) { Context.new }
    let (:user) do
      User.new 'kris', 'kris@gmail.com', :role => :waiter
    end

    before do
      CanTango.config.debug.set :on
      # context.user_ability(user).can? :read, Menu
    end

    describe 'should tell which permits allowe :read' do
      it 'should show WaiterRolePermit as the permit that allowed :read of Menu' do
        CanTango.permits_allowed(user, :read, Menu).should include(WaiterRolePermit)
      end
    end

    describe 'should tell which permits denied :write' do
      it 'should show WaiterRolePermit as the permit that denied :write of Menu' do
        CanTango.permits_denied(user, :write, Menu).should include(WaiterRolePermit)
      end
    end
  end
end