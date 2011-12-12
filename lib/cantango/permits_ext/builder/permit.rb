module CanTango
  module Builder
    module Permit
      sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
        sweetload :Base, :UserType, :AccountType
      end
    end
  end
end