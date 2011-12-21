require 'spec_helper'

module AdminAccountPermits
  class PublisherPermit < CanTango::Permit::UserType
  end
end

describe CanTango::Finder::Permit::Account do
  subject do
    CanTango::Permit::Finder::Account.new :publisher, :type => :user_type, :account => :admin
  end
  
  specify { subject.find_permit.should be_a PublisherPermit }
end
