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
        mode_rules
      end
      alias_method :execute!, :execute

      def mode_rules
        return unless modes.include? mode
        calc_rules_method = "#{mode}_rules"
        send(calc_rules_method) if respond_to?(calc_rules_method)
      end

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
      alias_method :permissions, :calc_rules
    end
  end
end
