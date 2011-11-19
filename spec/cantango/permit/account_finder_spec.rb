require 'spec_helper'

module AdminAccountPermits
  class PublisherRolePermit < CanTango::RolePermit
  end
end

describe CanTango::Permit::AccountFinder do
  subject do
    CanTango::Permit::AccountFinder.new :publisher, :type => :role, :account => :admin
  end
  
  specify { subject.permit.should be_a CanTango::Permit }
end
