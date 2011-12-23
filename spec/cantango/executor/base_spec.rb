require 'spec_helper'

require 'cantango/rspec/matchers'
require 'fixtures/models'
require 'cantango/rspec/matchers'

CanTango.config.permits.set :on

class AdminPermit < CanTango::Permit::UserType
  def initialize ability
    super
  end

  protected

  def permit_rules
    can :read, Article
  end
end

describe CanTango::PermitEngine::Executor::Base do
  before do
    @user = SimpleUser.new
    @ability = CanTango::Ability::Base.new @user
    @permit = AdminPermit.new @ability
    @executor = CanTango::PermitEngine::Executor::Base.new @permit
  end

  describe '#execute!' do
    describe 'should find permit based on #user_type' do
      specify { lambda{ @executor.execute! }.should_not raise_error }
    end
  end
end
