module CanTango
  module Builder
    module Permit
      sweet_scope :ns => {:CanTango => 'cantango/permits_ext'} do
        sweetload :Base, :RoleGroup, :Role, :UserType, :AccountType
      end
    end
  end
end