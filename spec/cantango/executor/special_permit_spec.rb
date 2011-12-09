require 'spec_helper'
require 'fixtures/models'

class SystemRolePermit < CanTango::Permit::Role
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

describe CanTango::PermitEngine::Executor::System do
  before do
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
    @ua = UserAccount.new user, :roles => [:admin, :user], :role_groups => []
    @user.account = @ua

    @ability = CanTango::Ability::Base.new @user

    @permit = SystemRolePermit.new @ability
    @executor = CanTango::PermitEngine::Executor::System.new @permit
  end

  before(:each) do
    CanTango.config.permits.set :on
  end

  describe '#execute!' do
    before:each do
      CanTango.config.permits.set :on
    end

    describe 'should execute permit' do
      # specify { ability.should be_allowed_to(:read, Article) }
      # specify { ability.should be_allowed_to(:write, Post) }
      # specify { ability.should be_allowed_to(:create, Comment) }

      specify { lambda{ executor.execute! }.should_not raise_error }
    end
  end
end
