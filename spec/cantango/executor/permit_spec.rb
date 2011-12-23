require 'spec_helper'
require 'fixtures/models'

class AdminPermit < CanTango::Permit::UserType
  def initialize ability
    super
  end

  protected

  def no_cache_rules
    can :edit, Article
    can :delete, Article
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
  context 'non-cached only' do
    before do
      CanTango.configure.ability.modes.execution.register :no_cache

      @admin    = Admin.new 'kris', 'kris@mail.ru'
      @ability  = CanTango::Ability::Base.new @admin
      @permit   = AdminPermit.new @ability
      @executor = CanTango::Executor::Permit::Base.new @permit
    end

    subject { @executor }

    describe 'config no_cache' do
      specify { CanTango.configure.ability.modes.execution.registered.should == [:no_cache] }
    end

    describe 'rules contain only non-cached rules' do
      before do
        subject.execute!
      end
      it 'should have 2 rules' do
        subject.rules.size.should == @ability.rules.size
      end
    end
  end
end
