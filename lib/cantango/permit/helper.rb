module CanTango
  module Permit
    module Helper
      def self.modules
        [:Execution, :License, :Naming]
      end
      
      sweetload *modules
    end
  end
end