module CanTango::Permit
  module Helper
    module Execution
      include CanTango::Helpers::Debug
      include CanTango::Permit::Helper::State

      # executes the permit
      def execute
        return if disabled?
        debug "Execute Permit: #{self}"
        
        # check current mode and execute accordingly!?
        calc_rules
      end
      alias_method :execute!, :execute

      # return the executor used to execute the permit
      def executor
        @executor ||= case self.class.name
        when /System/
          then CanTango::Executor::Permit::System.new self
        else
          CanTango::Executor::Permit::Base.new self
        end
      end

      def calc_rules
      end
    end
  end
end
