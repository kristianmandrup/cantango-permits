require 'spec_helper'

class AdminAccountPermitBuilder < CanTango::Builder::Permit::AccountType
end

describe CanTango::Builder::Permit::AccountType do
  before do 
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
    @ability = CanTango::Ability::Base.new @user
  end

  subject do
    AdminAccountPermitBuilder.new @ability
  end
  
  its(:permit_type) { should == :account_type }

  describe 'build' do
    its(:build) { should be_a CanTango::Permit::AccountType }
  end

  describe 'self.permit_type' do
    specify { AdminAccountPermitBuilder.permit_type.should == :account_type }
  end  
end
