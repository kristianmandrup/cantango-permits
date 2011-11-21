module CanTango
  module Permit
    module Helper
      def self.modules
        [:Execution, :License, :Naming, :RoleMatcher]
      end
      
      autoload_modules *modules
    end
  end
end