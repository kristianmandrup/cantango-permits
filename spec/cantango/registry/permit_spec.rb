require 'spec_helper'

class AdminUserPermit
end

class PermitReg
  include CanTango::Registry::Permit
end

describe CanTango::Registry::Permit do
  before do
    @reg = PermitReg.new

    CanTango.config.permits.types.register :user_type
    
    # puts CanTango.config.permits.types.inspect
    
    permit_registry = @reg.permit_registry_for(:user_type)
    permit_registry[:admin] = AdminUserPermit    
  end
  subject { @reg }
  
  describe 'permit_registry_for type' do
    context 'existing type' do
      specify { subject.permit_registry_for(:user_type).should be_a CanTango::Registry::Hash }
    end

    context 'non-existing type' do
      specify do
        lambda { subject.permit_registry_for(:unknown) }.should raise_error
      end
    end
  end

  describe 'registered_for type, name = nil' do
    context 'existing permit' do
      specify { subject.registered_for(:user_type, :admin).should == AdminUserPermit }
    end

    context 'non-existing permit type' do
      specify do
        lambda { subject.registered_for(:not_there, :unknown) }.should raise_error
      end
    end

    context 'non-existing permit' do
      specify do
        subject.registered_for(:user_type, :unknown).should be_nil
      end
    end
  end

  describe 'all' do
    specify do
      subject.all.first.registered.admin.should be_true
    end
  end

  describe 'show_all' do
    before do
      puts subject.show_all
    end
    specify do
      subject.show_all.should match(/admin/)
    end
  end
end
