require 'spec_helper'
require 'fixtures/models'

class SystemPermit < CanTango::Permit::Special
  def initialize ability
    super
  end

  protected

  def calc_rules
    can :read, Article
    can :write, Post
    can :create, Comment
    :break
  end
end

describe CanTango::Executor::Permit::Special do
  before do
    @user = User.new 'kris', 'kris@mail.ru'
    @ua = UserAccount.new @user
    @user.account = @ua

    @ability = CanTango::Ability::Base.new @user

    @permit = SystemRolePermit.new @ability
    @executor = CanTango::Executor::Permit::Special.new @permit
  end

  describe '#execute!' do
    describe 'should execute permit' do
      specify { lambda{ executor.execute! }.should_not raise_error }
    end
  end
end
