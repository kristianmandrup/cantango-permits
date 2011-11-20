require 'spec_helper'

class RolePermitBuilder < CanTango::Builder::Permit::Base
end

describe CanTango::Builder::Permit::Base do
  before do 
    @user = User.new 'kris'
  end
  
  let(:ability) { CanTango::Ability.new @user}

  subject do
    CanTango::Builder::Permit::Base.new ability
  end
  
  its(:permit_type) { should == :role_permit }

  specify { RolePermitBuilder.permit_type.should == :role_permit }
  
  specify { subject.build.should be_a CanTango::Permit::Base }
end
