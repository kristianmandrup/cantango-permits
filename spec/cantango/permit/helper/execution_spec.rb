require 'spec_helper'
require 'fixtures/models'

class ExecPermit < CanTango::Ability::Base
  include CanTango::Permit::Helper::Execution

  def initialize ability
    super
  end

  def calc_rules
    can :edit, Project
  end
end



describe CanTango::Permit::Helper::Execution do
  before do
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
  end
  subject { ExecPermit.new @user }

  describe 'executor' do
    specify { subject.executor.should be_a CanTango::Executor::Base }
  end

  describe 'execute' do
    context 'disabled' do
      before do
        subject.disable!
        subject.execute
      end
      specify { subject.rules.should be_empty }
    end
    
    context 'enabled' do
      before do
        subject.enable!
        subject.execute
      end
      specify { subject.rules.should_not be_empty }
    end
  end
end