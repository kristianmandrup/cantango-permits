require 'spec_helper'
require 'fixtures/models'

class AdminsRoleGroupPermit < CanTango::Permit::RoleGroup
  def initialize ability
    super
  end

  protected

  def calc_rules
  end
end

describe CanTango::Permit::Factory do
  before do
    CanTango.config.cache_engine.set :off
    
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
    @ua = UserAccount.new user, :roles => [:admin, :user], :role_groups => []
    @user.account = @ua
    @ability = CanTango::Ability::Base.new @user
  end

  subject { CanTango::Permit::Factory.new ability }

  describe 'attributes' do
    it "should have an ability" do
      subject.ability.should be_a(CanTango::Ability)
    end
  end

  describe '#build!' do
    it 'should build a list of permits' do
      subject.build!.should_not be_empty
    end
  end
end
