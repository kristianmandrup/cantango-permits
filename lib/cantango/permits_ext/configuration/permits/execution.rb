class CanTango::Configuration
  class Permits
    module Execution
      def was_executed permit, ability
        executed_for(ability) << permit
      end
      
      def executed_for ability
        executed[hash_key_for(ability)] ||= []
      end
      
      def executed
        @executed ||= {}
      end

      def clear_executed!
        @executed = nil
      end
    end
  end
end