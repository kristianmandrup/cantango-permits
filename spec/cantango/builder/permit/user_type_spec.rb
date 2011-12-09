require 'spec_helper'

class AdminUserPermitBuilder < CanTango::Builder::Permit::UserType
end

describe CanTango::Builder::Permit::UserType do
  before do 
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
    @ability = CanTango::Ability::Base.new @user
  end

  subject do
    AdminUserPermitBuilder.new @ability
  end
  
  its(:permit_type) { should == :user_type }

  describe 'build' do
    it 'should build permits' do
      its(:build) { should be_a CanTango::Permit::UserType }
    end
  end

  describe 'self.permit_type' do
    specify { AdminUserPermitBuilder.permit_type.should == :user_type }
  end
end
