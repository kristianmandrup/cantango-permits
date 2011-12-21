require 'spec_helper'

CanTango.config.permits.types.register :user_type
CanTango.config.debug.set :on

module AdminAccountPermits
  class PublisherPermit < CanTango::Permit::UserType
  end
end

describe CanTango::Finder::Permit::Account do
  subject do
    CanTango::Finder::Permit::Account.new :publisher, :type => :user_type, :account => :admin
  end
  
  describe '#account_registry' do
    it 'should return the permits registry for the given ccount' do
      subject.account_registry.should be_a CanTango::Registry::Permit::Base
    end
  end
  
  describe '#permits' do
    it 'should return the account permits for a given type' do
      subject.permits.should be_a CanTango::Registry::Hash
      subject.permits.registered.should be_a Hashie::Mash
    end
  end
  
  specify { subject.find_permit.should == AdminAccountPermits::PublisherPermit }
end
