module CanTango
  module Registry
    module Permit
      def registry_for type
        raise ArgumentError, "Not an available permit type, was: #{type} - available: #{available_types}" unless available_type? type
        inst_var_name = "@#{type}"
        instance_variable_set(inst_var_name, CanTango::Registry::Hash.new) if !instance_variable_get(inst_var_name)
        instance_variable_get(inst_var_name)
      end

      def registered_for type, name = nil
        name ? registry_for(type)[name.to_s] : registry_for(type)
      end

      def all
        (available_types - [:special]).map{|type| registry_for(type) }
      end

      def show_all
        (available_types - [:special]).map{|type| "#{type} -> #{show_hash_reg(registry_for(type))}"  }.join("\n")
      end
      
      protected

      def show_hash_reg reg
        reg.registered.map {|key, value| "#{key} (#{value})" }.join(',')
      end

      def available_type? type
        available_types.include? type
      end
      
      def available_types
        CanTango.config.permits.types.available
      end
      
      class Base
        include CanTango::Registry::Permit
      end
    end
  end
end



