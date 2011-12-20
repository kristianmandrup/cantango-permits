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

  describe '#permit_type' do
    it "should be disabled" do
      subject.permit_type.should == :user_type
    end
  end

  describe '#disable!' do
    before do
      subject.disable!
    end
    it "should be disabled" do
      subject.disabled?.should be_true
    end
  end

  describe '#disabled?' do
    it "should not be disabled" do
      subject.disabled?.should be_false
    end
  end

  describe '#valid?' do
    it "should return exception NotImplemented" do
      lambda { subject.valid? }.should raise_error
    end
  end

  describe '#category label' do
    it "should return models of that category" do
      subject.category('grains').should include('Wheat', 'Barley')
    end
  end

  describe '#any reg_exp' do
    it "should return matching models of ORM" do
      subject.any(/Item/).should include('Item', 'ProductItem')
    end
  end

  describe '#build_permit' do
    it "should build a permit" do
      subject.build_permit(:mine).should be_a CanTango::Permit::Mine
    end
  end

  describe '#builder' do
    it "should have a builder" do
      subject.builder.should be_a CanTango::Builder::Permit::Base
    end
  end

  describe '#finder' do
    it "should have a finder" do
      subject.finder.should be_a CanTango::Finder::Permit::Base
    end
  end

  describe '#account_type' do
    it "should be the permit for the :admin account" do
      subject.account_type.should == :admin
    end
  end

  specify { subject.ability.should be_a(CanTango::Ability) }
end