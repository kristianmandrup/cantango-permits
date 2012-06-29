module CanTango
  module Builder
    module Permit
      sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
        sweetload :Base, :UserType, :AccountType, :Special
      end
    end
  end
end