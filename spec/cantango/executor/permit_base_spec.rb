require 'spec_helper'
require 'fixtures/models'

class AdminPermit < CanTango::Permit::UserType
  def initialize ability
    super
  end

  protected

  def calc_rules
    can :read, Article
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

describe CanTango::Executor::Permit::Base do
  before do
    @user     = Admin.new 'kris', 'kris@mail.ru'
    @ability  = CanTango::Ability::Base.new @user
    @permit   = AdminPermit.new @ability
    @executor = CanTango::Executor::Permit::Base.new @permit
  end

  describe '#execute!' do
    describe 'should find permit based on #user_type' do
      specify { lambda{ @executor.execute! }.should_not raise_error }
    end

    describe 'should define read Article rule' do
      specify do
        @executor.execute!
        @executor.permit.rules.should_not be_empty
      end
    end
  end
end