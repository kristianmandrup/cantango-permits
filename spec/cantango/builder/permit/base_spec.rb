require 'spec_helper'

class RolePermitBuilder < CanTango::Builder::Permit::Base
end

describe CanTango::Builder::Permit::Base do
  before do 
    @user = User.new 'kris', 'kris@mail.ru', :roles => [:editor]
    @ability = CanTango::Ability::Base.new @user
  end

  subject do
    RolePermitBuilder.new ability
  end
  
  its(:permit_type) { should == :role_permit }

  specify { RolePermitBuilder.permit_type.should == :role_permit }
  
  specify { subject.build.should be_a CanTango::Permit::Base }
end
