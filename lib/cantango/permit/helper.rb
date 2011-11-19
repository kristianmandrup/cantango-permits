module CanTango
  module Permit
    module Helper
      def self.modules
        [:Execution, :License, :Naming]
      end
      
      autoload_modules modules
    end
  end
end