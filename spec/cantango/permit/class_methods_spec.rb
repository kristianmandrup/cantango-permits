require 'spec_helper'
require 'fixtures/models'

class MyOwnPermit < CanTango::Permit::Base
  def initialize ability
    super
  end

  protected

  def calc_rules
    can :read, Article
  end
end

describe CanTango::Permit::ClassMethods do
  before do
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
    @ability = CanTango::Ability::Base.new @user
    @permit = MyOwnPermit.new @ability
  end

  # describe 'inherited(subclass)' do
  #   it "should be the permit for the :admin account" do
  #     @permit.account_type.should == :admin
  #   end
  # 
  #   it "should have an ability" do
  #     @permit.ability.should be_a(CanTango::Ability)
  #   end
  # end
  
  describe 'finder' do
    before do
      @finder = MyOwnPermit.finder
    end
    specify { @finder.should be_a CanTango::Finder::Permit::Base }

    # specify { @finder.account.should == nil }
    # specify { @finder.type.should == nil }
    # specify { @finder.name.should == nil }
  end
  
  # describe 'builder' do
  #   before do
  #     @builder = MyOwnPermit.builder
  #   end
  #   specify { @builder.should be_a CanTango::Builder::Permit::Base }
  # end
end

