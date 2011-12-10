module CanTango
  module Permit
    module Helper
      def self.modules
        [:State, :Execution, :License, :Naming]
      end
      
      sweetload *modules
    end
  end
end