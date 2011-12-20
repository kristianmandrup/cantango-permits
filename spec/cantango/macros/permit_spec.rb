require 'spec_helper'

class NoTypePermit
end

class NoName
end

class GoodPermit
end

CanTango.config.permits.types.register :user_type, CanTango::Permit::UserType

describe CanTango::Macros::Permit do
  describe '#tango_permit' do
    it 'should not register permit without type' do
      lambda { NoTypePermit.tango_permit }.should raise_error(CanTango::Permit::MissingTypeError)
    end

    it 'should not register permit without name' do
      lambda { NoName.tango_permit :type =>:user_type }.should raise_error(CanTango::Permit::MissingNameError)
    end    

    describe 'should register permit with type set explicitly and valid name' do
      specify do
        lambda { GoodPermit.tango_permit(:type => :user_type) }.should_not raise_error
      end

      describe 'registration' do
        before do
          @options = GoodPermit.tango_permit(:type => :user_type)
        end
        specify { CanTango.config.permits.registered_for(:user_type).registered.should include(:good) }
      end
    end
  end
end

