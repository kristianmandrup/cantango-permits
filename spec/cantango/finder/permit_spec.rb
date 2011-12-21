require 'spec_helper'

CanTango.config.permits.types.register :user_type
CanTango.config.debug.set :on

class EditorPermit < CanTango::Permit::UserType
end

describe CanTango::Finder::Permit::Base do
  before do
    @finder = CanTango::Finder::Permit::Base.new :editor, :type => :user_type
  end
  subject { @finder }
  
  its(:type) { should == :user_type }
  its(:name) { should == :editor }

  it 'should have registered the permit' do
    CanTango.config.permits.registered_for(:user_type, :editor).should_not be_nil
  end
  
  specify { subject.find_permit.should == EditorPermit }
end
