require 'spec_helper'

CanTango.config.permits.types.register :user_type
CanTango.config.debug.set :on

class EditorPermit < CanTango::Permit::UserType
end

class UserTypePermitBuilder < CanTango::Builder::Permit::Base
end

describe CanTango::Builder::Permit::Base do
  before do 
    @user = User.new 'kris', 'kris@mail.ru'
    @ability = CanTango::Ability::Base.new @user
    @finder = CanTango::Finder::Permit::Base.new :editor, :type => :user_type
  end

  subject do
    UserTypePermitBuilder.new @ability, @finder
  end
  
  its(:permit_type) { should == :user_type }

  specify { UserTypePermitBuilder.permit_type.should == :user_type }
  
  specify do
    lambda { subject.build }.should raise_error NotImplementedError
  end
end
