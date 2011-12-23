require 'spec_helper'
require 'fixtures/models'

CanTango.config.debug.set :on

class AdminPermit < CanTango::Permit::UserType
  def initialize ability
    super
  end

  protected

  def calc_rules
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

describe CanTango::Factory::Permits do
  before do    
    @user = User.new 'kris', 'kris@mail.ru'
    @admin = Admin.new 'admin', 'admin@mail.ru'
    @ua = UserAccount.new @user
    @user.account = @ua

    @ability = CanTango::Ability::Base.new @user
    @admin_ability = CanTango::Ability::Base.new @admin

    @factory = CanTango::Factory::Permits.new @ability, :user_type
    @admin_factory = CanTango::Factory::Permits.new @admin_ability, :user_type
  end

  context 'Admin permits factory' do
    subject { @factory }

    describe '#create' do
      it 'should build a list of permits' do
        subject.create.should be_empty
      end
    end
  end

  context 'Admin permits factory' do
    subject { @admin_factory }

    describe 'attributes' do
      it "should have an ability" do
        subject.ability.should be_a(CanTango::Ability::Base)
      end
    end

    describe '#create' do
      it 'should build a list of permits' do
        subject.create.should_not be_empty
      end

      it 'should have the AdminPermit in the list' do    
        subject.create.first.should be_a AdminPermit
      end
    end
  end
end