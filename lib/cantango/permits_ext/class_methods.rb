module CanTango
  module ClassMethods
    def permits_allowed candidate, actions, subjects, *extra_args
      raise "Debugging has not been turned on. Turn it on using: CanTango.debug!" if CanTango.config.debug.off?
      config.permits.allowed candidate, actions, subjects, *extra_args
    end

    def permits_denied candidate, actions, subjects, *extra_args
      raise "Debugging has not been turned on. Turn it on using: CanTango.debug!" if CanTango.config.debug.off?
      config.permits.denied candidate, actions, subjects, *extra_args
    end

    def debug_permits_registry
      puts "permits registry:" << CanTango.config.permits.show_all.inspect
    end

    def debug_ability candidate, actions, subjects, *extra_args
      puts "Ability: #{actions} on #{subjects}"
      puts "permits allowed:" << permits_allowed(candidate, actions, subjects, *extra_args).inspect
      puts "permits denied:"  << permits_denied(candidate, actions, subjects, *extra_args).inspect
    end

    def clear_permits_executed!
      config.permits.clear_executed!
    end
  end
  extend ClassMethods
end