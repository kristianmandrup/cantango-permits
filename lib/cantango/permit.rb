module CanTango
  module Permit
    autoload_modules :Base, :ClassMethods, :Helper
    autoload_modules :RoleGroup, :Role, :UserType, :AccountType, :Special, :User
  end
end
