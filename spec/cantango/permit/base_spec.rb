require 'spec_helper'
require 'fixtures/models'

class MyPermit < CanTango::Permit::Base
  def initialize ability
    super
  end

  protected

  def calc_rules
    can :read, Article
  end
end

describe CanTango::Permit::Base do
  before do
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
    @ability = CanTango::Ability::Base.new @user
    @permit = AdminAccountPermit.new @ability
  end

  subject { @permit }

  describe 'attributes' do
    it "should be the permit for the :admin account" do
      subject.account_type.should == :admin
    end

    it "should have an ability" do
      subject.ability.should be_a(CanTango::Ability)
    end
  end
end