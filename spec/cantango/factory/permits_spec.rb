require 'spec_helper'
require 'fixtures/models'

CanTango.config.permits.types.register :user_type
CanTango.config.debug.set :on

class AdminPermit < CanTango::Permit::UserType
  def initialize ability
    super
  end

  protected

  def calc_rules
  end
end

describe CanTango::Factory::Permits do
  before do    
    @user = User.new 'kris', 'kris@mail.ru'
    @ua = UserAccount.new @user
    @user.account = @ua
    @ability = CanTango::Ability::Base.new @user
  end

  subject { CanTango::Factory::Permits.new @ability, :user_type }

  describe 'attributes' do
    it "should have an ability" do
      subject.ability.should be_a(CanTango::Ability::Base)
    end
  end

  describe '#create' do
    it 'should build a list of permits' do
      subject.create.should_not be_empty
    end
  end
end
