require 'spec_helper'

class EditorRolePermit < CanTango::RolePermit
end

describe CanTango::Permit::AccountFinder do
  subject do
    CanTango::Permit::Finder.new :editor, :type => :role
  end
  
  specify { subject.permit.should be_a CanTango::Permit }
end
