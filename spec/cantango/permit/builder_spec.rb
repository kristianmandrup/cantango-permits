require 'spec_helper'

class RolePermitBuilder < CanTango::Permit::Builder
end

describe CanTango::Permit::Builder do
  before do 
    @user = User.new 'kris'
  end
  
  let(:ability) { CanTango::Ability.new @user}

  subject do
    CanTango::Permit::Builder.new ability
  end
  
  its(:permit_type) { should == 'role_permit' }
  
  specify { subject.build.should be_a CanTango::Permit }
end
