module CanTango
  module Registry
    module Permit
      def permit_registry_for type
        raise ArgumentError, "Not an available permit type" if !CanTango.config.permits.types.available.include? type
        inst_var_name = "@#{type}"
        instance_variable_set(inst_var_name, HashRegistry.new) if !instance_variable_get(inst_var_name)
        instance_variable_get(inst_var_name)
      end

      def registered_for type, name = nil
        name ? registered_by(type)[name.to_s] : registered_by(type)
      end

      def all
        (CanTango.config.permits.available_types - [:special]).map{|type| permit_registry_for(type) }
      end

      def show_all
        all.map(&:registered)
      end
    end
  end
end



