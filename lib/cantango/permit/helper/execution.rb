module CanTango::Permit
  module Helper
    module Execution
      include CanTango::Helpers::Debug

      attr_writer :disabled

      # executes the permit
      def execute
        return if disabled?
        debug "Execute Permit: #{self}"
        executor.execute!
      end

      def disable!
        @enabled = false
      end

      def disabled?
        !enabled?
      end

      def enable!
        @enabled = true
      end
      
      def enabled?
        @enabled == true
      end

      # return the executor used to execute the permit
      def executor
        @executor ||= case self.class.name
        when /System/
          then CanTango::Executor::System.new self
        else
          CanTango::Executor::Base.new self
        end
      end

      def calc_rules
      end
    end
  end
end
