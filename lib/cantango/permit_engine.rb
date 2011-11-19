require 'cantango'

module CanTango
  class PermitEngine < Engine
    autoload_modules :PermitFactory,  :PermitFinder, :PermitBuilder
    autoload_modules :PermitExecutor, :AbstractPermitExecutor, :SystemPermitExecutor
    autoload_modules :Loaders, :Util, :RoleMatcher, :Compatibility

    include CanTango::AbilityExecutor
    include CanTango::Ability::Helpers::Role
    include CanTango::Ability::Helpers::User

    def initialize ability
      super
    end

    def permit_rules
      # push result of each permit type execution into main ability rules array
      permits.each_pair do |type, permits|
        perm_rules = executor(type, permits).execute!
        rules << perm_rules if !perm_rules.blank?
      end
    end

    def executor type, permits
      CanTango::AbilityExecutor::PermitType.new self, type, permits
    end

    def engine_name
      :permit
    end

    def valid?
      return false if !valid_mode?
      permits.empty? ? invalid : true
    end

    # by default, only execute permits for which the user
    # has a role or a role group
    # also execute any permit marked as special
    def permits
      @permits ||= permit_factory.build!
    end

    def permit_class_names
      @permit_class_names ||= permits.map{|p| p.class.to_s}
    end

    protected

    alias_method :cache_key, :engine_name

    def start_execute
      debug "Permit Engine executing..."
    end

    def end_execute
      debug "Done executing Permit Engine"
    end

    def invalid
      debug "No permits found!"
      false
    end

    def permit_factory
      @permit_factory ||= CanTango::Permit::Factory.new self
    end

    def key_method_names
      permits.keys.map do |permit|
        permit_class = available_permits_for permit
        permit_class.hash_key if permit_class && permit_class.respond_to?(:hash_key)
      end.compact
    end
    
    def available_permits_for type
      CanTango.config.permits.available_permits[type]
    end
  end
end
